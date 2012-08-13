#!/usr/bin/Rscript
#X11()
pdf('graphs/x.code_y.test.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('summary/all.data', header = TRUE, row.names = 1)
plot(0, type ="n", main="Code/Test Distribution", xlab = "Code (lines)", ylab = "Test (Lines)", xlim=c(0,10000), ylim=c(0,10000))
grid()
points(data$code_lines, data$test_lines)
#message("Press Return To Continue")
#invisible(readLines("stdin", n=1))
