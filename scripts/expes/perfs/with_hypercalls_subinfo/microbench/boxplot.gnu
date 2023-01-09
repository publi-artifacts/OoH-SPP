set terminal pdf size 6,2.5

deepskyblue = "#00BFFF"
limegreen = "#32CD32"
mediumorchid = "#BA55D3"
yellow = "#FCFC00"
crimson = "#DC143C"
set style line 3 lc rgb limegreen lt 2 lw 2
set style line 4 lc rgb yellow lt 2 lw 2 
set style line 5 lc rgb crimson lt 2 lw 2 
set style line 6 lc rgb deepskyblue lt 2 lw 3 

set ylabel "Time (ns)" font "Times,22"
set xlabel "Pool Size Order (n) - Size = 2^n" font "Times,22" offset 0,-.5

set style fill transparent solid 0.6 border -1
set style boxplot nooutliers #pointtype 7
set style data boxplot
set boxwidth  0.5
#set pointsize 0.5

set rmargin 0

set output 'best_case.pdf'
set key top center Left reverse maxrows 1 samplen .7 width .5 nobox font "Times,16"
set border 2
set xtics ('0' 1, '2' 2, '3' 3, '5' 4, '7' 5, '9' 6) scale 0.0 #) 
set xtics  font "Times, 18" nomirror #offset 0,1
set ytics  font "Times, 18" nomirror

set yrange [0:4000]
#set ytics ('0' 0,'0.5' 500,'1' 1000,'1.5' 1500,'2' 2000,'2.5' 2500,'3' 3000)


#plot 'all.data' u (1):1 notitle lc rgb limegreen lw 1.5, '' u (2):2 notitle lc rgb limegreen lw 1.5, '' u (3):3 notitle lc rgb limegreen lw 1.5, '' u (4):4 notitle lc rgb limegreen lw 1.5, '' u (5):5 notitle lc rgb limegreen lw 1.5, '' u (6):6 notitle lc rgb limegreen lw 1.5

plot 'best_nopt.data' u (1):1 t 'w/o Page Walk Opti.' lc rgb limegreen lw 1.5, '' u (2):2 notitle lc rgb limegreen lw 1.5, '' u (3):3 notitle lc rgb limegreen lw 1.5, '' u (4):4 notitle lc rgb limegreen lw 1.5, '' u (5):5 notitle lc rgb limegreen lw 1.5, '' u (6):6 notitle lc rgb limegreen lw 1.5,\
'best_opt.data' u (1):1 t 'w. Page Walk Opti.' lc rgb yellow  lw 1.5, '' u (2):2 notitle lc rgb yellow  lw 1.5, '' u (3):3 notitle lc rgb yellow  lw 1.5, '' u (4):4 notitle lc rgb yellow  lw 1.5, '' u (5):5 notitle lc rgb yellow  lw 1.5, '' u (6):6 notitle lc rgb yellow  lw 1.5


