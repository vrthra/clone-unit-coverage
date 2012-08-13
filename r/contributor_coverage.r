#!/usr/bin/Rscript
#X11()
pdf('graphs/x.contrib_y.coverage.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('summary/all.data', header = TRUE, row.names = 1)
plot(0, type ="n", main="Contributor/Coverage Distribution", xlab = "Contributors (#)", ylab = "Coverage (%)", xlim=c(0,100), ylim=c(0,100))
grid()
x <- data$contributors
y <- data$coverage_percent
points(x, y)

cor(x,y)
#message("Press Return To Continue")
#invisible(readLines("stdin", n=1))
