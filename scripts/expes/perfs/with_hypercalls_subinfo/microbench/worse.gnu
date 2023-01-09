set terminal pdf size 9,3.8

deepskyblue = "#00BFFF"
limegreen = "#32CD32"
mediumorchid = "#BA55D3"
yellow = "#FCFC00"
crimson = "#DC143C"
pink1 ="#FFB6C1"; pink2 ="#C71585"; pink3 ="#DB7093"
orange2 = "#E69F00"
set style line 3 lc rgb 'violet' lt 2 lw 2
set style line 4 lc rgb deepskyblue lt 2 lw 2 
set style line 5 lc rgb crimson lt 2 lw 2 
set style line 6 lc rgb orange2 lt 2 lw 3 

set style data histograms
set style histogram cluster gap 1
set style fill solid 0.9 noborder
set offset -0.5,-0.5,0,0 #y1,y2,x1,x2
set boxwidth .95 absolute

set border
set grid
set tics

set lmargin 10
set bmargin 6
set rmargin 7

set xtics font "Times, 30" nomirror scale 0 offset 0,-.8
set ytics font "Times, 30" offset -.3
#set y2tics font "Times, 35" offset -1.5 scale 0

set xlabel "Pool Size Order (n) - Size = 2^n" font "Times,35" offset 0,-2
set ylabel "Time (µs)" font "Times,32" offset -2
#set y2label "#PF (x1000)" font "Times,28" offset -3.5

set output 'mean_worse_pf.pdf'

#set yrange[0:100]
#set y2range[0:12]
#set y2tics 3
set ytics 20

set key center left Left reverse maxcols 1 samplen .4 width .5 box font "Times,28"
#plot 'worse_both.data' u ($4/1000) t '#PFs' ls 6 axes x1y2, '' u ($3/1000):xtic(1) t 'With Optimization' ls 4, '' u ($2/1000) t 'Time w/o PW Opti.' ls 5
plot 'worse_both.data' u ($3/1000):xtic(1) t 'With Optimization' ls 6, '' u ($2/1000) t 'Without Optimization' ls 5

unset y2label
unset y2tics
unset ylabel
set rmargin 2
set lmargin 7.5
#set tmargin .5

#set terminal pdf size 3,1.2
set yrange [0:]
set ytics 40
set xtics font "Times, 26" nomirror scale 0 offset 0,.2
set xtics font "Times, 26" offset 0,.3
set ylabel "Time (ms)" font "Times,32" offset .5

unset key
set key center Left reverse maxcols 1 samplen .7 width .5 box font "Times,25"

#set size 4,2.2
set output 'worse_all_pf.pdf'
plot 'worse_both.data' u 1:(($4*$2)/1000000) t 'w/o PW Opti.' w l lc rgb crimson lt 3 lw 3.5 smooth sbezier, '' u 1:(($4*$3)/1000000) t 'w. PW Opti.' w l lc rgb deepskyblue lt 3 lw 3.5 smooth sbezier

