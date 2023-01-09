set terminal pdf size 4,2

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

set grid ytics
set grid xtics
set xtics nomirror

#--------------------------------------------------------------------------------------------------
#set bmargin 7
#set lmargin 5
set tmargin 2
unset key

set ytics font "Times, 12" offset .5
set xtics font "Times, 12"
set y2tics font "Times, 12" offset -1.2
set xlabel "Protection Frequency" font "Times,15" 
set ylabel "Memory Overhead (x)" font "Times,15" offset 2
set y2label "Security Distance (KB)" font "Times,15" offset -3.5

set output 'blackscholes.pdf'
set yrange[0:12]
set ytics 3,3,12
set y2range[0:4]
set y2tics 1,1,4

#set key box transparent fc rgb mediumorchid solid 0.75
set key top center Left reverse maxcols 1 samplen .7 width .5 nobox font "Times,14"

plot 'blackscholes.data' u 1:2 smooth sbezier t 'Consumption' ls 4, '' u 1:($3/1000) smooth sbezier t 'Security' ls 3 axes x1y2
