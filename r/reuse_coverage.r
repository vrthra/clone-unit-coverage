#!/usr/bin/Rscript
#X11()
pdf('graphs/x.dup_y.coverage.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('rdata/filtered.data', header = TRUE, row.names = 1)
plot(0, type ="n", main="Reuse/Coverage Distribution", xlim=c(0,100), ylim=c(0,100), xlab = "Reuse (%)", ylab = "Coverage (%)")
grid()
x <- (data$dup_files/data$total_files) * 100
y <- data$coverage_p
points(x, y)

#cor(x,y)
#message("Press Return To Continue")
#invisible(readLines("stdin", n=1))
