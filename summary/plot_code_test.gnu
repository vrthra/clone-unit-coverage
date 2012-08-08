#!/usr/bin/gnuplot
set autoscale
unset log
set xlabel "Code lines"
set ylabel "Test lines"
# code test
plot "all.data" using 3:4 with points

pause -1
