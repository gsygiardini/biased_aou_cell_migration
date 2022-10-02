reset
set encoding utf8
set log
set key Left
set key right

#set tics scale 3.0
set border linewidth 2.5
set format y "10^{%T}"
set format x "10^{%T}"
set key font ",18"
set key reverse

LW = 5
PS = 2
LT = 7
EV = 1

dataFile1 = "MeanSpd_10_0.04405_0_1.dat"
dataFile2 = "MeanSpd_10_0.2625_0_1.dat"
dataFile3 = "MeanSpd_10_0.965_0_1.dat"
dataFile4 = "MeanSpd_10_1.7425_0_1.dat"

set term post enh col font "Latin_Modern_Roman" 22 size 20cm,16cm
set out "speed.eps"

phi=0
aux=0.04405
#aux=1.7425

g=10.0
#k=aux/phi
k1=0.04405
k2=0.2625
k3=0.965
k4=1.7425

q=0.1
y=1.0
b=1.0


#set xrange [S/10:1000*P]
set yrange [0.006:50]

set xlabel "{/:Italic {/Symbol d}}"
set ylabel "{/:Italic <v_{avg}(T,{/Symbol d},)>}"


plot dataFile1 every EV u 1:2 w lp lt LT ps PS lw LW lc rgb "black" title sprintf("k=%g",k1),\
     dataFile2 every EV u 1:2 w lp lt LT ps PS lw LW lc rgb "red" title sprintf("k=%g",k2),\
     dataFile3 every EV u 1:2 w lp lt LT ps PS lw LW lc rgb "green" title sprintf("k=%g",k3),\
     dataFile4 every EV u 1:2 w lp lt LT ps PS lw LW lc rgb "blue" title sprintf("k=%g",k4)

