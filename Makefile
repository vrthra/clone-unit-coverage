simian=./simian/bin/simian-2.3.33.jar

default:
	@echo "  " cp js-to-test.js check
	@echo "  " make check-\<js-to-test\>.js

run-all:
	find src -name \*.js > args.lst #|xargs java -jar $(simian)
#| ./simian.rb $(file)

# target = $@ source = $^
%.js: check/%.js
	@rm -rf src/tst; mkdir src/tst
	@cp $^ src/tst
	@$(MAKE) run-all file=$@
