sagacli=$(base)/tools/saga/saga-cli
sagacore=$(base)/tools/saga/saga-cli
sagalib=$(base)/tools/saga
sagacp=$(sagacli)/target/classes:$(sagacore)/target/classes:$(sagalib)/saga-cli-1.0.10-jar-with-dependencies.jar

ls = $(shell cd $(base); ls src)

%.report: Makefile.%
	$(MAKE) -f $^ run-report base=.. 
	
