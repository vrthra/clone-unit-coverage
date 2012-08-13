#!/usr/bin/Rscript
#X11()
pdf('graphs/contrib.pdf')
#total_files     dup_files       code_lines      test_lines      contributors    coverage_percent
data <- read.table('rdata/filtered.data', header = TRUE, row.names = 1)
#cloc_test       cloc_total      contrib_count   coverage_p      dup_files       test_files      total_files

z <- data$contrib_count
y <- z[z < 200]

hist(y, col="lightgreen", main = "Contributor distribution", ylab="Projects", breaks = c(0,10,20,30,40,50,60,70,80,90,100, 110,120,130,140,150,160,170,180,190,200)  )
#message("Press Return To Continue")
#invisible(readLines("stdin", n=1))
