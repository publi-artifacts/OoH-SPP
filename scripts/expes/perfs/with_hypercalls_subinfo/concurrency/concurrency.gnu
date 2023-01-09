set terminal pdf size 4.2,1.8

deepskyblue = "#00BFFF"
limegreen = "#32CD32"
mediumorchid = "#BA55D3"
yellow = "#FCFC00"
crimson = "#DC143C"
orange2 = "#E69F00"

set style line 5 lc rgb mediumorchid lt 2 lw 2 
set style line 6 lc rgb orange2 lt 2 lw 3 

set style data histograms
#set style histogram cluster gap 1
set style fill solid noborder
set offset -0.9,-0.5,0,0 #y1,y2,x1,x2
set boxwidth 2 absolute

set border
set grid ytics
set grid mytics
set mytics 5

set lmargin 7.5
set bmargin 3.5
unset rmargin

set xtics font "Times, 16" nomirror scale 0 offset 1,0
set ytics font "Times, 16" #offset .5
set xlabel "#Concurrent Apps" font "Times,16"
set ylabel "Mean Time \nIncrease (x)" font "Times,18" #offset 1

set output 'concurrency.pdf'

set yrange[0:2]
#set y2range[0:120]
#set y2tics 0,30,120
set ytics 1

#set key top left Left reverse maxcols 1 samplen .7 width .5 box font "Times,12"
plot 'concurrency.data' u 2:xtic(1) notitle ls 6 #, '' u 2 t 'App Execution' ls 5
