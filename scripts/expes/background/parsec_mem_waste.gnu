set terminal pdf size 3.5,1.8

red2 = "#B22222"; green2 = "#8FBC8F"; blue3 = "#56B4E9"; blue2 = "#20B2AA"; brown = "#492201"; orange2 = "#E69F00"; violet1="#660066"
newblue1 = "#87A7B3"; newblue2 = "#324756"; newblue3 = "#082032"; newblue4 = "#045491"; gray = "#696969"
set style line 1 lc rgb green2 lt 1 lw 1
set style line 2 lc rgb 'black' lt 1 lw 1
set style line 3 lc rgb orange2 lt 2 lw 2
set style line 4 lc rgb newblue4 lt 2 lw 2

#set style line 1 lc rgb green2 lt 1 lw 1
#set style line 2 lc rgb 'black' lt 1 lw 1
#set style line 3 lc rgb blue3 lt 2 lw 2
#set style line 4 lc rgb orange2 lt 2 lw 2
#set style line 6 lc rgb newblue3 lt 2 lw 2

set grid ytics
set grid xtics
set tics nomirror
set noborder
#--------------------------------------------------------------------------------------------------

set style data histograms
set style fill transparent solid 0.75 noborder
set style histogram cluster gap .9
set offset -.9,0.1,0,0
set boxwidth .8 absolute
#--------------------------------------------------------------------------------------------------
set bmargin 7
#set lmargin 5
set tmargin 2
unset key

set xtics font "Times, 14" rotate by 90 right scale 0 offset 2.2,.2 #
set ytics font "Times, 14" scale 0
set xlabel "App" font "Times,14" offset 0,2.5
set ylabel "Mem. Overhead (x)" font "Times,14" # offset -1

set output 'waste1.pdf'
set yrange[0:80]
set ytics 0,20,80
#set xtics center

#set key top left Left reverse maxcols 1 maxrows 4 samplen 1 width .6 box font "Times,30"

plot 'parsec_mem_waste.data' u 2:xticlabels(1) ls 6
