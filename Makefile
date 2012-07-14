simian=./simian/bin/simian-2.3.33.jar

check=check

ls = $(shell ls src)

default:
	@echo "  " cp js-to-test.js check
	@echo "  " make \<js-to-test\>.js

run-all:
	find src -name \*.js |./xa java -jar $(simian)| ./analyze/simian.rb $(file)

run-once:
	find src/$(src) $(file) -name \*.js |./xa java -jar $(simian)| ./analyze/simian.rb $(file)

# target = $@ source = $^
%.js: check/%.js
	for i in $(ls); do echo $i; $(MAKE) run-once file=$^ src=$$i; done
	#@$(MAKE) run-all file=$@
