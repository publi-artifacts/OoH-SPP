set terminal pdf #size 10,6

set ytics font "Times, 28"
set xtics font "Times, 28"
set grid
set tics nomirror
#unset border
#set border 3

set ylabel "CDF" font "Times,32" offset -1.5
set xlabel "Security Distance (KB)" font "Times,32" offset 0,-1
set key right Left invert reverse maxcols 1 samplen 1 width .7 nobox font "Times,25"

set bmargin 5
set lmargin 10

#path="freq_10/plot"

set xtics offset 0,-.5
set format x "10^{%L}"
set xrange [0.004:1000]
set ytics .2
set logscale x
set mxtics 10 #minor xtics --> for subgraduations
#set yrange [0:1]
#set ytics 0,.2,1

set output "cdf_protect_blacksch_custom.pdf"

plot "freq_50/plot/blackscholes_cdf" u 1:2 t 'F=50' w lp lw 2,\
     "freq_20/plot/blackscholes_cdf" u 1:2 t 'F=20' w lp lw 2,\
     "freq_15/plot/blackscholes_cdf" u 1:2 t 'F=15' w lp lw 2,\
     "freq_10/plot/blackscholes_cdf" u 1:2 t 'F=10' w lp lw 2,\
     "freq_5/plot/blackscholes_cdf" u 1:2 t 'F=5' w lp lw 2,\
     "freq_3/plot/blackscholes_cdf" u 1:2 t 'F=3' w lp lw 2,\
     "freq_2/plot/blackscholes_cdf" u 1:2 t 'F=2' w lp lw 2

#################################################
unset key
set key left Left invert reverse maxcols 1 samplen 1 width .7 nobox font "Times,25"
set xrange [0.004:20000]

set output "cdf_protect_blacksch_vanilla.pdf"

plot "distance_secu_slim_gp_default/cdf_50" u 1:2 t 'P=2%' w lp lw 1.5 ps .8,\
     "distance_secu_slim_gp_default/cdf_20" u 1:2 t 'P=5%' w lp lw 1.5 ps .8,\
     "distance_secu_slim_gp_default/cdf_15" u 1:2 t 'P=6%' w lp lw 1.5 ps .8,\
     "distance_secu_slim_gp_default/cdf_10" u 1:2 t 'P=10%' w lp lw 1.5 ps .8,\
     "distance_secu_slim_gp_default/cdf_5" u 1:2 t 'P=20%' w lp lw 1.5 ps .8,\
     "distance_secu_slim_gp_default/cdf_3" u 1:2 t 'P=30%' w lp lw 1.5 ps .8,\
     "distance_secu_slim_gp_default/cdf_2" u 1:2 t 'P=50%' w lp lw 1.5 ps .8
