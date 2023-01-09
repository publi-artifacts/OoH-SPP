set terminal pdf size 9,3

limegreen = "#32CD32"
limegreendark = "#008000"
crimson = "#DC143C"
crimsondark = "#8D0D26"
mediumorchid = "#BA55D3" 
orchiddark = "#773687"

set bmargin 5
set lmargin 12

set xtics font "Times, 26" nomirror scale 0 offset 0,-.4
set ytics font "Times, 25" nomirror scale 0
set ylabel "Time (µs)" font "Times,30" offset -2.5
set xlabel "Protection Frequency" font "Times,30" offset 0,-1
set grid
set key center Left reverse maxrows 1 samplen .7 width .5 box font "Times,22"

set yrange [0:2100]
set ytics 300

set output 'basic_costs_first.pdf'
plot 'basic_costs.data' u 1:($3/1000) t 'LeanGuard' w l lc rgb orchiddark lt 3 lw 3.5 smooth sbezier,\
     '' u 1:($2/1000) t 'SlimGuard' w l lc rgb limegreendark lt 3 lw 3.5 smooth sbezier


set output 'basic_costs_others.pdf'
#set terminal pdf size 9,3

set key center Left reverse maxrows 1 samplen .7 width .5 box font "Times,22"

set ylabel "Time (ns)" font "Times,30" offset -2.5
set yrange [0:2100]
set ytics 300

plot 'basic_costs.data' u 1:5 t 'Other Malloc LeanGuard' w l lc rgb orchiddark lw 3 smooth sbezier,\
     '' u 1:4 t 'Other Malloc SlimGuard' w l lc rgb limegreendark lw 3 smooth sbezier
