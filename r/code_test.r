#!/usr/bin/Rscript
#X11()
pdf('graphs/x.code_y.test.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('rdata/filtered.data', header = TRUE, row.names = 1)
#plot(0, type ="n", main="Test Distribution", xlab="#Total files", ylab="#Test files", xlim=c(0,10000), ylim=c(0,10000))
#grid()
z <- data$cloc_test / data$cloc_total
y <- z[z < 1]*100

hist(y, col="lightblue", main = "Test/Total% distribution", ylab="Projects", breaks = c(0,10,20,30,40,50,60,70,80,90,100)  )
#message("Press Return To Continue")
#invisible(readLines("stdin", n=1))
