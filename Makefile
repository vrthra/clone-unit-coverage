run-all:
	(cd ../src; java -jar simian/bin/simian-2.3.33.jar  **/*.js) | echo $(FILE) # ./simian.rb $(FILE)

# target = $@ source = $^
check-%.js: %.js
	mkdir ../src/tst
	cp $^ ../src/tst
	$(MAKE) run-all FILE=$^
