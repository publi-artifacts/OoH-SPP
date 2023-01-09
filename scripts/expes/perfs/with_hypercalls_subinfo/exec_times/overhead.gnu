set terminal pdf size 9,4.5
#set terminal lua tikz standalone size 5in, 3in color
#set output '| sed ''s/\\gpfill{color=gpbgfillcolor}//g'' > histograms.tex'

newblue1 = "#87A7B3"; newblue2 = "#324756"; newblue3 = "#082032"
pink1 ="#FFB6C1"; pink2 ="#C71585"; pink3 ="#DB7093"

deepskyblue = "#00BFFF"
skybluedarker = "#006282"
limegreen = "#32CD32"
limegreendark = "#008000"
mediumorchid = "#BA55D3" 
orchiddark = "#773687"
orchiddarker = "#4C2256"
yellow = "#FCFC00"
crimson = "#DC143C"
crimsondark = "#8D0D26"
marron = "#800000"
orange2 = "#E69F00"
blackcurrant = "#27122C"

set style line 1 lc rgb mediumorchid lt 1 lw 1
set style line 2 lc rgb orchiddark lt 1 lw 1
set style line 3 lc rgb limegreen lt 1 lw 1
set style line 4 lc rgb limegreendark lt 1 lw 1
set style line 5 lc rgb  orchiddarker lt 1 lw 1
set style line 6 lc rgb blackcurrant  lt 1 lw 1
set style line 7 lc rgb deepskyblue lt 1 lw 1
set style line 8 lc rgb skybluedarker lt 1 lw 1

set style data histograms
set style histogram rowstacked
set offset -0.4,-0.4,0,0
set style fill solid 1 noborder
set boxwidth .9 relative

set title font "Times, 32" offset 0,-1.5
set ylabel "Time (s)" font "Times,32" offset -1.5
set ytics font "Times, 26"
set xtics font "Times, 25" rotate by 90 right scale 0 #tc rgb newblue2
set grid ytics
set tics nomirror
set key font "Times,26" bmargin center Left reverse invert maxrows 2 samplen 1.5 width .8 nobox

set bmargin 10
set lmargin 10
unset colorbox
#-------------------------------------------------------------------------------------------------------------------------------------

set output 'overhead.pdf'
set yrange [0:]
set ytics 100
unset xtics

#offset 0,-3.5
plot newhistogram "raytrace" font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 5 notitle ls 3,\
     '' 	       using 3 index 5 notitle ls 4,\
     '' 	       using 4 index 5 notitle ls 5,\
     '' 	       using 5 index 5 notitle ls 6,\
     '' 	       using 6 index 5 notitle ls 1,\
     '' 	       using 7 index 5 notitle ls 2,\
     '' 	       using ($9/1000000000) index 5 notitle ls 5,\
     '' 	       using 8 index 5 notitle ls 6,\
     newhistogram "freqm." font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 4 notitle ls 3,\
     '' 	       using 3 index 4 notitle ls 4,\
     '' 	       using 4 index 4 notitle ls 5,\
     '' 	       using 5 index 4 notitle ls 6,\
     '' 	       using 6 index 4 notitle ls 1,\
     '' 	       using 7 index 4 notitle ls 2,\
     '' 	       using ($9/1000000000) index 4 notitle ls 5,\
     '' 	       using 8 index 4 notitle ls 6,\
     newhistogram "dedup" font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 2 notitle ls 3,\
     '' 	       using 3 index 2 notitle ls 4,\
     '' 	       using 4 index 2 notitle ls 5,\
     '' 	       using 5 index 2 notitle ls 6,\
     '' 	       using 6 index 2 notitle ls 1,\
     '' 	       using 7 index 2 notitle ls 2,\
     '' 	       using ($9/1000000000) index 2 notitle ls 5,\
     '' 	       using 8 index 2 notitle ls 6,\
     newhistogram "blacsk." font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 0 notitle ls 3,\
     '' 	       using 3 index 0 notitle ls 4,\
     '' 	       using 4 index 0 notitle ls 5,\
     '' 	       using 5 index 0 notitle ls 6,\
     '' 	       using 6 index 0 notitle ls 1,\
     '' 	       using 7 index 0 notitle ls 2,\
     '' 	       using ($9/1000000000) index 0 notitle ls 5,\
     '' 	       using 8 index 0 notitle ls 6,\
     newhistogram "x264" font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 8 notitle ls 3,\
     '' 	       using 3 index 8 notitle ls 4,\
     '' 	       using 4 index 8 notitle ls 5,\
     '' 	       using 5 index 8 notitle ls 6,\
     '' 	       using 6 index 8 notitle ls 1,\
     '' 	       using 7 index 8 notitle ls 2,\
     '' 	       using ($9/1000000000) index 8 notitle ls 5,\
     '' 	       using 8 index 8 notitle ls 6,\
     newhistogram "bodytr." font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 1 notitle ls 3,\
     '' 	       using 3 index 1 notitle ls 4,\
     '' 	       using 4 index 1 notitle ls 5,\
     '' 	       using 5 index 1 notitle ls 6,\
     '' 	       using 6 index 1 notitle ls 1,\
     '' 	       using 7 index 1 notitle ls 2,\
     '' 	       using ($9/1000000000) index 1 notitle ls 5,\
     '' 	       using 8 index 1 notitle ls 6,\
     newhistogram "fluid." font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 3 notitle ls 3,\
     '' 	       using 3 index 3 notitle ls 4,\
     '' 	       using 4 index 3 notitle ls 5,\
     '' 	       using 5 index 3 notitle ls 6,\
     '' 	       using 6 index 3 notitle ls 1,\
     '' 	       using 7 index 3 notitle ls 2,\
     '' 	       using ($9/1000000000) index 3 notitle ls 5,\
     '' 	       using 8 index 3 notitle ls 6,\
     newhistogram "swapt." font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 7 notitle ls 3,\
     '' 	       using 3 index 7 notitle ls 4,\
     '' 	       using 4 index 7 notitle ls 5,\
     '' 	       using 5 index 7 notitle ls 6,\
     '' 	       using 6 index 7 notitle ls 1,\
     '' 	       using 7 index 7 notitle ls 2,\
     '' 	       using ($9/1000000000) index 7 notitle ls 5,\
     '' 	       using 8 index 7 notitle ls 6,\
     newhistogram "stream." font "Times, 28" offset 0,-1.8,\
     'overhead.data' using 2:xtic(1) index 6 t 'User Time SlimGuard' ls 3,\
     '' 	       using 3 index 6 t 'System Time SlimGuard' ls 4,\
     '' 	       using 4 index 6 notitle ls 5,\
     '' 	       using 5 index 6 notitle ls 6,\
     '' 	       using 6 index 6 t 'User Time LeanGuard' ls 1,\
     '' 	       using 7 index 6 t 'System Time LeanGuard' ls 2,\
     '' 	       using ($9/1000000000) index 6 t 'Hypercalls Time' ls 5,\
     '' 	       using 8 index 6 t 'SPPT walk' ls 6

#set output
#system('pdflatex histograms.tex')
