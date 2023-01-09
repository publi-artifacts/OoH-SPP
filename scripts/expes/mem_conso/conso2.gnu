set terminal pdf size 18,5	
set output 'wss2.pdf'
set multiplot #layout 1,2

red2 = "#B22222"; green2 = "#8FBC8F"; blue3 = "#56B4E9"; blue2 = "#20B2AA"; brown = "#492201"; orange2 = "#E69F00"; violet1="#660066"
newblue1 = "#87A7B3"; newblue2 = "#324756"; newblue3 = "#082032"; newblue4 = "#045491"; gray = "#696969"
deepskyblue = "#00BFFF"
limegreen = "#32CD32"
mediumorchid = "#BA55D3"
yellow = "#FCFC00"
crimson = "#DC143C"
set style line 1 lc rgb limegreen lt 1 lw 1
set style line 2 lc rgb orange2 lt 1 lw 1
set style line 3 lc rgb deepskyblue lt 2 lw 2
set style line 4 lc rgb mediumorchid lt 2 lw 2
set style line 6 lc rgb crimson lt 2 lw 2

set style data histograms
set style histogram cluster gap 1
set style fill solid
set offset -0.4,-0.4,0,0
set boxwidth .9 absolute

set ylabel "Memory Con-\nsumption (MB)" font "Times,32" offset -6
set xtics font "Times, 28" scale 0 #rotate by 90 right  offset 1.5 #scale 0 --> remove the line graduation on the axis
set ytics font "Times, 28"
set grid ytics
set tics nomirror 
#-----------------------------------------------------------------------------------------------------
set bmargin 3
set lmargin 15
set tmargin 4
set size 1./4,.45
#--------------------------------------------------------------------------------------------------
set key font "Times,18" tmargin center Right noreverse maxrow 1 samplen .5 width .3 nobox
unset key
set yrange [0:80]
set ytics 20

set origin 0,1./2
set title 'blackscholes' font "Times,28" offset 0,-1

plot 'wss.data'using 3 index 0 t 'LeanGuard' ls 3,\
     '' using 2:xtic(1) index 0 t 'SlimG+GuaNary' ls 4,\
     '' using 4 index 0 t 'SlimG+GP' ls 6,\
     '' index 18 w l lw 3.5 lc rgb 'orange2' t 'SlimG+Canary'
     #'' index 17 w l lw 2 lc rgb orange2 t 'SlimGDefault',\

#--------------------------------------------------------------------------------------------------
unset lmargin
#set lmargin 10
unset key
unset ylabel
set origin 1./4,1./2 
set yrange [0:80]
set ytics 20
set title 'raytrace' font "Times,28" offset 0,-1

plot 'wss.data' using 3 index 2 notitle ls 3,\
     '' using 2:xtic(1) index 2 notitle ls 4,\
     '' using 4 index 2 notitle ls 6,\
     '' index 32 w l lw 3.5 lc rgb 'orange2'
#     '' index 31 w l lw 2 lc rgb orange2,\

#--------------------------------------------------------------------------------------------------
set origin 2./4,1./2
set title 'bodytrack' font "Times,28" offset 0,-1

plot 'wss.data' using 3 index 1 notitle ls 3,\
     '' using 2:xtic(1) index 1 notitle ls 4,\
     '' using 4 index 1 notitle ls 6,\
     '' index 20 w l lw 3.5 lc rgb 'orange2'
     #'' index 19 w l lw 2 lc rgb orange2,\

#--------------------------------------------------------------------------------------------------
set origin 3./4,1./2
set title 'streamcluster' font "Times,28" offset 0,-1

plot 'wss.data' using 3 index 6 notitle ls 3,\
     '' using 2:xtic(1) index 6 notitle ls 4,\
     '' using 4 index 6 notitle ls 6,\
     '' index 22 w l lw 3.5 lc rgb 'orange2'
     #'' index 21 w l lw 2 lc rgb orange2,\

#--------------------------------------------------------------------------------------------------
set lmargin 15
set ylabel "Memory Con-\nsumption (MB)" font "Times,32" offset -6
set origin 0,0
set title 'x264' font "Times,28" offset 0,-1

plot 'wss.data' using 3 index 8 notitle ls 3,\
     '' using 2:xtic(1) index 8 notitle ls 4,\
     '' using 4 index 8 notitle ls 6,\
     '' index 24 w l lw 3.5 lc rgb 'orange2'
     #'' index 23 w l lw 2 lc rgb orange2,\

#--------------------------------------------------------------------------------------------------
unset lmargin
unset ylabel
set origin  1./4,0
set title 'swaptions' font "Times,28" offset 0,-1

plot 'wss.data' using 3 index 7 notitle ls 3,\
     '' using 2:xtic(1) index 7 notitle ls 4,\
     '' using 4 index 7 notitle ls 6,\
     '' index 26 w l lw 3.5 lc rgb 'orange2'
     #'' index 25 w l lw 2 lc rgb orange2,\

#--------------------------------------------------------------------------------------------------
set origin 2./4,0
set yrange [0:160]
set ytics 40
set title 'freqmine' font "Times,28" offset 0,-1

plot 'wss.data' using 3 index 5 notitle ls 3,\
     '' using 2:xtic(1) index 5 notitle ls 4,\
     '' using 4 index 5 notitle ls 6,\
     '' index 28 w l lw 3.5 lc rgb 'orange2'
     #'' index 27 w l lw 2 lc rgb orange2,\

#--------------------------------------------------------------------------------------------------
set origin 3./4,0
set yrange [0:600]
set ytics 150
set title 'dedup' font "Times,28" offset 0,-1

plot 'wss.data'using 3 index 3 notitle ls 3,\
     '' using 2:xtic(1) index 3 notitle ls 4,\
     '' using 4 index 3 notitle ls 6,\
     '' index 30 w l lw 3.5 lc rgb 'orange2'
     #'' index 29 w l lw 2 lc rgb orange2,\

unset multiplot
