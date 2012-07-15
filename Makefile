simian=./tools/simian/bin/simian-2.3.33.jar

pmdbase=./tools/pmd-bin-5.0.0/
pmdjars=:$(pmdbase)lib/ant-1.8.1.jar:$(pmdbase)lib/ant-launcher-1.8.1.jar:$(pmdbase)lib/ant-testutil-1.7.1.jar:$(pmdbase)lib/asm-3.2.jar:$(pmdbase)lib/dom4j-1.6.1.jar:$(pmdbase)lib/icu4j-2.6.1.jar:$(pmdbase)lib/javacc-4.1.jar:$(pmdbase)lib/jaxen-1.1.1.jar:$(pmdbase)lib/jdom-1.0.jar:$(pmdbase)lib/junit-4.4.jar:$(pmdbase)lib/pmd-5.0.0.jar:$(pmdbase)lib/rhino-1.7R3.jar:$(pmdbase)lib/saxon-9.1.0.8.jar:$(pmdbase)lib/xalan-2.6.0.jar:$(pmdbase)lib/xercesImpl-2.9.1.jar:$(pmdbase)lib/xml-apis-1.3.02.jar:$(pmdbase)lib/xmlParserAPIs-2.6.2.jar:$(pmdbase)lib/xom-1.0.jar
pmdrunner=net.sourceforge.pmd.cpd.CPD

ls = $(shell ls src)

default:
	@echo "  " cp js-to-test.js check
	@echo "  " make \<js-to-test\>.js


run-once:
	find src/$(src) $(file) -name \*.js |./bin/xa java -jar $(simian)| ./analyze/simian.rb $(file)

run-pmd:
	java -Xss10m -Xmx1548m -cp $(pmdjars) $(pmdrunner) --files src --language ecmascript --minimum-tokens 100 | tee run.pmd.log

run-simian:
	find src -name \*.js |./bin/xa java -jar $(simian)| tee run.simian.log

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

# target = $@ source = $^
%.js: check/%.js
	for i in $(ls); do echo $i; $(MAKE) run-once file=$^ src=$$i; done
	#@$(MAKE) run-all file=$@
