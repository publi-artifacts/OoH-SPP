set terminal pdf size 5.7,2.8

orange2 = "#E69F00"
deepskyblue = "#00BFFF"
limegreen = "#32CD32"
mediumorchid = "#BA55D3"
yellow = "#FCFC00"
crimson = "#DC143C"
pink1 ="#FFB6C1"; pink2 ="#C71585"; pink3 ="#DB7093"
set style line 1 lc rgb limegreen lt 1 lw 1
set style line 2 lc rgb yellow lt 1 lw 1
set style line 3 lc rgb deepskyblue lt 2 lw 2
set style line 4 lc rgb mediumorchid lt 2 lw 2
set style line 6 lc rgb crimson lt 2 lw 2
set style line 7 lc rgb pink3 lt 2 lw 2

set style data histograms
set style histogram rowstacked
set style fill solid  0.8 noborder
set offset -0.65,-0.4,0,0
set boxwidth .85 absolute
unset border

set ylabel "Time (µs)" font "Times,22" offset -.8
set xtics font "Times, 22" rotate by 90 right scale 0
set ytics font "Times, 22" scale 0
unset grid
unset border
set tics nomirror 
#-----------------------------------------------------------------------------------------------------
set bmargin 9
set lmargin 10
#set tmargin 2
#--------------------------------------------------------------------------------------------------
set key font "Times,18" center top Right noreverse invert maxcol 2 maxrow 2 samplen .5 width .3 nobox
set ytics 400
set output "all_pf.pdf"

set label 1 "628MB" at .04,100 front center font "Times ,12" tc rgb "gray"
set label 2 "84MB" at 1,110 front center font "Times ,12" tc rgb "gray"
set label 3 "623MB" at 2,110 front center font "Times ,12" tc rgb "gray"
set label 4 "534MB" at 3,130 front center font "Times ,12" tc rgb "gray"
set label 5 "112MB" at 4,140 front center font "Times ,12" tc rgb "gray"
set label 6 "128MB" at 5,250 front center font "Times ,12" tc rgb "gray"
set label 7 "8MB" at 6,330 front center font "Times ,12" tc rgb "gray"
set label 8 "1.5GB" at 7,1210 front center font "Times ,12" tc rgb "gray"
set label 9 "846MB" at 8,1600 front center font "Times ,12" tc rgb "gray"

plot 'all.data' using ($2/1000):xtic(1) t 'Best Case' ls 1,\
   '' 	       using ($3/1000) t 'Worse Case' ls 6

