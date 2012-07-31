simian=./tools/simian/bin/simian-2.3.33.jar

pmdbase=./tools/pmd-bin-5.0.0/
pmdjars=:$(pmdbase)lib/ant-1.8.1.jar:$(pmdbase)lib/ant-launcher-1.8.1.jar:$(pmdbase)lib/ant-testutil-1.7.1.jar:$(pmdbase)lib/asm-3.2.jar:$(pmdbase)lib/dom4j-1.6.1.jar:$(pmdbase)lib/icu4j-2.6.1.jar:$(pmdbase)lib/javacc-4.1.jar:$(pmdbase)lib/jaxen-1.1.1.jar:$(pmdbase)lib/jdom-1.0.jar:$(pmdbase)lib/junit-4.4.jar:$(pmdbase)lib/pmd-5.0.0.jar:$(pmdbase)lib/rhino-1.7R3.jar:$(pmdbase)lib/saxon-9.1.0.8.jar:$(pmdbase)lib/xalan-2.6.0.jar:$(pmdbase)lib/xercesImpl-2.9.1.jar:$(pmdbase)lib/xml-apis-1.3.02.jar:$(pmdbase)lib/xmlParserAPIs-2.6.2.jar:$(pmdbase)lib/xom-1.0.jar
pmdrunner=net.sourceforge.pmd.cpd.CPD

#    -ignoreCharacterCase[+|-]    Matches character literals irrespective of case
#    -ignoreCharacters[+|-]       Completely ignores character literals
#    -ignoreCurlyBraces[+|-]      Completely ignores curly braces
#    -ignoreIdentifierCase[+|-]   Matches identifiers irresepctive of case
#    -ignoreIdentifiers[+|-]      Completely ignores identifiers
#    -ignoreLiterals[+|-]         Completely ignores all literals (strings, numbers and characters)
#    -ignoreModifiers[+|-]        Ignores modifiers (public, private, static, etc.)
#    -ignoreNumbers[+|-]          Completely ignores numbers
#    -ignoreRegions[+|-]          Ignores all lines between #region/#endregion
#    -ignoreStringCase[+|-]       Matches string literals irrespective of case
#    -ignoreStrings[+|-]          Completely ignores the contents of strings
#    -ignoreSubtypeNames[+|-]     Matches on similar type names (eg. Reader and FilterReader)
#    -ignoreVariableNames[+|-]    Completely ignores variable names (fields, parameters and locals)
#    -reportDuplicateText[+|-]    Prints the duplicate text in reports
#    -threshold=COUNT             Matches will contain at least the specified number of lines

T=10
simopts= -reportDuplicateText \
         -threshold=$(T) \
         -ignoreCharacters \
         -ignoreCurlyBraces \
         -ignoreIdentifiers \
         -ignoreLiterals \
         -ignoreModifiers \
         -ignoreNumbers \
         -ignoreStrings \
         -ignoreSubtypeNames \
         -ignoreVariableNames 

java=java -Xss16m -Xmx1700m 

ls = $(shell ls src)

default:
	@echo "  " cp js-to-test.js check
	@echo "  " make \<js-to-test\>.js

log/run.pmd.log: 
	$(java) -cp $(pmdjars) $(pmdrunner) \
             --files src --language ecmascript --minimum-tokens $(T) > log/run.pmd.log
log/run.simian.log: 
	find x/src -name \*.js |./bin/xa $(java) -XX:-UseConcMarkSweepGC -jar $(simian) $(simopts) > log/run.simian.log

z:
	s=`date`;for i in x/src/*; do \
	echo $i;\
	find x/src/$i -name \*.js |./bin/xa $(java) -XX:-UseConcMarkSweepGC -jar $(simian) $(simopts) ;\
	done; \
	echo $$s; date

run-pmd: log/run.pmd.log

run-simian: log/run.simian.log

dup-pmd: log/run.pmd.log
	echo "This finds duplications across projects"
	cat log/run.pmd.log | ./bin/analyze/pmd.rb -all

dup-simian: log/run.simian.log
	echo "This finds duplications across projects"
	cat log/run.simian.log | ./bin/analyze/simian.rb -all

dup-tctoolkit: log/run.tctoolkit.log
	echo "This finds duplications across projects"
	cat log/run.tctoolkit.log | ./bin/analyze/tctoolkit.rb -all

#reports = $(shell cd reports; ls Makefile.*)
#run-report: $(reports)

save/%-projects.txt:
	find ./github/db/cache/ -name .\* | while read a; \
		do if [ `cat $${a} | grep '/$*/' | grep '\.html$$'| wc -l`  -gt 0 ] ; \
	     then	cat $${a} | head -1 | awk -F\/ '{print "/"$$2"/"$$3}' ; \
			 fi ; \
		done | sort -u | tee save/$*-projects.txt

src/%/.checkedout: list-gen
	echo checkout $*
	cat save/*-projects.txt |grep '/$*$$' |while read a; do \
 	(cd src; [ -d src/$* ] || git clone git://github.com$${a}; touch `pwd`/$*/.checkedout; ) \
	done

log/%-report.log: src/%/.checkedout
	cat save/spec-projects.txt |grep '$*$$' | while read a; do \
	  (cd reports; $(MAKE) -f Makefile.spec run-report comp=$*; ) \
		done
	cat save/test-projects.txt |grep '$*$$' | while read a; do \
	  (cd reports; $(MAKE) -f Makefile.test run-report comp=$*; ) \
		done
	if [ `find reports/$*.results -name \*.html | wc -l` -lt 1 ]; then \
	  rm -rf src/$*; touch src/$*/.spec; touch src/$*/.test; \
		rm -rf reports/$*.result; rm -f log/$*-report.log; \
	fi

list-gen: save/spec-projects.txt save/test-projects.txt

Makefile.%:
	echo > log/$*-report.log
	cd reports; $(MAKE) -f $@ run-report

# entry
report:
	echo > log/saga.log
	$(MAKE) run-report
	echo reports done

run-once-simian:
	find src/$(src) $(file) -name \*.js |./bin/xa java -jar $(simian) $(simopts) \
             | tee -a log/simian-$(target)-original.log \
             | ./bin/analyze/simian.rb $(file) \
             | tee -a log/simian-$(target).log

run-once-pmd:
	rm -rf src/$(src)/_match; mkdir -p src/$(src)/_match
	cp check/$(target) src/match/$(target)
	$(java) -cp $(pmdjars) $(pmdrunner) \
             --files src/$(src) --language ecmascript --minimum-tokens $(T) \
             | tee -a log/pmd-$(target)-original.log \
             | ./bin/analyze/pmd.rb src/$(src)/_match/$(target) \
             | tee -a log/pmd-$(target).log
	rm -rf src/$(src)/_match

run-once-clonedigger:
	(pwd=`pwd`; cd tools/clonedigger/clonedigger/; \
	find $${pwd} -name \*.js > file.lst; \
	./clonedigger.py --file-list=./file.lst -o $${pwd}/log/clonedigger.html --language js )

run-once-tctoolkit:
	(pwd=`pwd`; cd tools/tctoolkit/TCToolkit-0.5.7/tctoolkit; \
	python cdd.py -f $${pwd}/log/tctoolkit.out ~/research/clone-unit-coverage/src )


# target = $@ source = $^ stem = $*
type=simian
%.js: check/%.js
	echo > log/$(type)-$@.log
	echo > log/$(type)-$@-original.log
	for i in $(ls); do echo $i; $(MAKE) run-once-$(type) file=$^ target=$@ src=$$i; done

%.similar : check/%.js
	echo > log/text-similar-$*.log
	find src -name \*.js | grep -v test | while read a; \
	do \
	    echo `./bin/text_similarity.pl --type Text::Similarity::Overlaps $^ $$a` $$a; \
	done | tee log/text-similar-$*.log | nl


copy:
	find ./src -name \*.js | grep -v spec | grep -v test | cpio -ov > x.cpio
	cat x.cpio | (cd x; cpio -div)
