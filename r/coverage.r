#!/usr/bin/Rscript
#X11()
pdf('graphs/coverage.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('rdata/filtered.data', header = TRUE, row.names = 1)
#cloc_test       cloc_total      contrib_count   coverage_p      dup_files       test_files      total_files

a <- data$coverage_p

a[a=='-'] <- 0
a <- as.numeric(a)
hist(a[a<100], col="lightgreen", main = "Coverage distribution", xlab = "Coverage", ylab="Projects", breaks = c(0,10,20,30,40,50,60,70,80,90,100)  )

