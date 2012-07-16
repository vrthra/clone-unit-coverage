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

T=5
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



ls = $(shell ls src)

default:
	@echo "  " cp js-to-test.js check
	@echo "  " make \<js-to-test\>.js

log/run.pmd.log: 
	java -Xss10m -Xmx1548m -cp $(pmdjars) $(pmdrunner) \
             --files src --language ecmascript --minimum-tokens $(T) > log/run.pmd.log
log/run.simian.log: 
	find src -name \*.js |./bin/xa java -jar $(simian) $(simopts) > log/run.simian.log

run-pmd: log/run.pmd.log

run-simian: log/run.simian.log

dup-pmd: log/run.pmd.log
	echo "This finds duplications across projects"
	cat log/run.pmd.log | ./bin/analyze/pmd.rb -all

dup-simian: log/run.simian.log
	echo "This finds duplications across projects"
	cat log/run.simian.log | ./bin/analyze/simian.rb -all

reports = $(shell cd reports; ls Makefile.*)
run-report: $(reports)
Makefile.%:
	echo > log/$*-report.log
	cd reports; $(MAKE) -f $@ run-report base=..

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
	rm -rf src/match; mkdir -p src/match
	cp check/$(target) src/match/$(target)
	java -Xss10m -Xmx1548m -cp $(pmdjars) $(pmdrunner) \
             --files src --language ecmascript --minimum-tokens $(T) \
             | tee -a log/pmd-$(target)-original.log \
             | ./bin/analyze/pmd.rb src/match/$(target) \
             | tee -a log/pmd-$(target).log
	rm -rf src/match

# target = $@ source = $^
%.js: check/%.js
	echo > log/simian-$@.log
	echo > log/simian-$@-original.log
	for i in $(ls); do echo $i; $(MAKE) run-once-pmd file=$^ target=$@ src=$$i; done

