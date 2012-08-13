#!/usr/bin/Rscript
#X11()
pdf('graphs/testfiles.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('rdata/filtered.data', header = TRUE, row.names = 1)
#cloc_test       cloc_total      contrib_count   coverage_p      dup_files       test_files      total_files

z <- data$test_files * 100/ data$total_files
y <- z[z < 100]

hist(y, col="lightgreen", main = "Testfiles distribution", ylab="Projects", xlab="%testfiles", breaks = c(0,10,20,30,40,50,60,70,80,90,100)  )
#message("Press Return To Continue")
#invisible(readLines("stdin", n=1))
