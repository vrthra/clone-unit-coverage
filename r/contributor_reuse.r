#!/usr/bin/Rscript
#X11()
pdf('graphs/x.contrib_y.reuse.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('summary/all.data', header = TRUE, row.names = 1)
plot(0, type ="n", main="Contributor/Reuse Distribution", xlab = "Contributors (#)", ylab = "Reuse (%)", xlim=c(0,100), ylim=c(0,100))
grid()
x <- data$contributors
y <- (data$dup_files/data$total_files) * 100
points(x, y)

cor(x,y)
#message("Press Return To Continue")
#invisible(readLines("stdin", n=1))
