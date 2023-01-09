set terminal pdf size 20,6
set output 'optimum_horizontal.pdf'
set multiplot #layout 1,2

red2 = "#B22222"; green2 = "#8FBC8F"; blue3 = "#56B4E9"; blue2 = "#20B2AA"; brown = "#492201"; orange2 = "#E69F00"; violet1="#660066"
newblue1 = "#87A7B3"; newblue2 = "#324756"; newblue3 = "#082032"; newblue4 = "#045491"; gray = "#696969"

deepskyblue = "#00BFFF"
limegreen = "#32CD32"
mediumorchid = "#BA55D3"
yellow = "#FCFC00"
crimson = "#DC143C"

set style line 1 lc rgb green2 lt 1 lw 1 
set style line 2 lc rgb 'black' lt 1 lw 1
set style line 3 lc rgb orange2 lt 2 lw 2
set style line 4 lc rgb newblue4 lt 2 lw 2 

set grid 
set xtics nomirror
set ytics nomirror

set size 1./4,.5
#--------------------------------------------------------------------------------------------------
#set tmargin 8
#set rmargin 10
set bmargin 5
set lmargin 8

set xtics font "Times, 28"
set ytics font "Times, 28" offset .5
set y2tics font "Times, 28" offset -1.2
set ylabel "Mem. Overhead (x)" font "Times,32" offset -.5
set y2label "Security Dist. (KB)" font "Times,32" #offset 3.5

unset key

unset y2label
set y2range[0:4]
set y2tics 1,1,4
set yrange [0:12]
set ytics 3,3,12

set origin 0,1./2
set title 'blackscholes' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:2 smooth sbezier t 'Consumption' ls 4, '' u 1:($3/1000) smooth sbezier t 'Security' ls 3 axes x1y2

#--------------------------------------------------------------------------------------------------
set key top center Left reverse maxrows 1 samplen .7 width .5 nobox font "Times,28"
unset ylabel
unset y2label
unset yrange

set yrange [0:5]
set y2range [0:5]
set ytics 1,1,5
set y2tics 1,1,5

set origin 1./4,.5
set title 'bodytrack' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:4 smooth sbezier t 'Consumption' ls 4, '' u 1:($5/1000) smooth sbezier t 'Security' ls 3 axes x1y2

#--------------------------------------------------------------------------------------------------
unset key

set yrange [0:10]
set y2range [0:5]
set ytics 2,2,10
set y2tics 1,1,5

set origin 2./4,.5
set title 'raytrace' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:6 smooth sbezier t 'Consumption' ls 4, '' u 1:($7/1000) smooth sbezier t 'Security' ls 3 axes x1y2

#-------------------------------------------------------------------------------------------------
set y2label "Security Dist. (KB)" font "Times,32" #offset 3.5

set yrange [0:6]
set y2range [0:3]
set ytics 2,2,6
set y2tics 1,1,3

set origin 3./4,.5
set title 'streamcluster' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:8 smooth sbezier t 'Consumption' ls 4, '' u 1:($9/1000) smooth sbezier t 'Security' ls 3 axes x1y2

#--------------------------------------------------------------------------------------------------
unset y2label
set ylabel "Mem. Overhead (x)" font "Times,32" offset -.5
set xlabel "Protection Frequency" font "Times,32" offset 0,-.8

set yrange [0:10]
set y2range [0:5]
set ytics 2,2,10
set y2tics 1,1,5

set origin 0,0
set title 'swaptions' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:10 smooth sbezier t 'Consumption' ls 4, '' u 1:($11/1000) smooth sbezier t 'Security' ls 3 axes x1y2

#--------------------------------------------------------------------------------------------------
unset ylabel

set yrange [0:6]
set y2range [0:3]
set ytics 2,2,6
set y2tics 1,1,3

set origin 1./4,0
set title 'x264' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:12 smooth sbezier t 'Consumption' ls 4, '' u 1:($13/1000) smooth sbezier t 'Security' ls 3 axes x1y2

#--------------------------------------------------------------------------------------------------
set yrange [0:4]
set y2range [0:4]
set ytics 1,1,4
set y2tics 1,1,4

set origin 2./4,0
set title 'dedup' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:14 smooth sbezier t 'Consumption' ls 4, '' u 1:($15/1000) smooth sbezier t 'Security' ls 3 axes x1y2

#--------------------------------------------------------------------------------------------------
set y2label "Security Dist. (KB)" font "Times,32" #offset 3.5

set origin 3./4,0
set title 'freqmine' font "Times,28" offset 0,-1
plot 'optimum.data' u 1:16 smooth sbezier t 'Consumption' ls 4, '' u 1:($17/1000) smooth sbezier t 'Security' ls 3 axes x1y2

unset multiplot
