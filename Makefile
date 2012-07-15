simian=./tools/simian/bin/simian-2.3.33.jar

PMDBASE=./tools/pmd-bin-5.0.0/
pmdjars=:$(PMDBASE)lib/ant-1.8.1.jar:$(PMDBASE)lib/ant-launcher-1.8.1.jar:$(PMDBASE)lib/ant-testutil-1.7.1.jar:$(PMDBASE)lib/asm-3.2.jar:$(PMDBASE)lib/dom4j-1.6.1.jar:$(PMDBASE)lib/icu4j-2.6.1.jar:$(PMDBASE)lib/javacc-4.1.jar:$(PMDBASE)lib/jaxen-1.1.1.jar:$(PMDBASE)lib/jdom-1.0.jar:$(PMDBASE)lib/junit-4.4.jar:$(PMDBASE)lib/pmd-5.0.0.jar:$(PMDBASE)lib/rhino-1.7R3.jar:$(PMDBASE)lib/saxon-9.1.0.8.jar:$(PMDBASE)lib/xalan-2.6.0.jar:$(PMDBASE)lib/xercesImpl-2.9.1.jar:$(PMDBASE)lib/xml-apis-1.3.02.jar:$(PMDBASE)lib/xmlParserAPIs-2.6.2.jar:$(PMDBASE)lib/xom-1.0.jar

pmdrunner=net.sourceforge.pmd.cpd.CPD

check=check

ls = $(shell ls src)

default:
	@echo "  " cp js-to-test.js check
	@echo "  " make \<js-to-test\>.js

run-all:
	find src -name \*.js |./xa java -jar $(simian)| tee run.log

run-once:
	find src/$(src) $(file) -name \*.js |./xa java -jar $(simian)| ./analyze/simian.rb $(file)

run-pmd:
	java -Xss10m -Xmx1024m -cp $(pmdjars) $(pmdrunner) --files src --language ecmascript --minimum-tokens 100

# target = $@ source = $^
%.js: check/%.js
	for i in $(ls); do echo $i; $(MAKE) run-once file=$^ src=$$i; done
	#@$(MAKE) run-all file=$@
