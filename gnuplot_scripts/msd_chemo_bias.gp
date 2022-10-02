reset
set encoding utf8
set log
set key Left
set key left

#set tics scale 3.0
set border linewidth 2.5
set format y "10^{%T}"
set format x "10^{%T}"
set key font ",18"

set term post enh col font "Latin_Modern_Roman" 22 size 20cm,16cm
set out "conta_msd.eps"

phi=0.1
aux=0.04405
#aux=1.7425

g=10.0
#k=aux/phi
k=0.04405
q=0.1
y=1.0
b=10.0

S = 2.*q*k*(y+2.*k)*(y+k) / (g+2.*q*k*(y+2.*k)*(y+k))
P = 1./(y+2.*k)

#set xrange [S/10:1000*P]
#set xrange [0.0001:1000]


f(x) = (g/((y+2.*k)*(y+k)))*(x - (1./(y+2.*k))*(1.-exp(-(y+2.*k)*x)) ) + 2.*q*k*x #MSD Normal


msd(x) = (2*(b*b)/((y+k)*(y+k))) * (-1/(k*k)-1/(2*(y+k)*(y+2*k)) - exp(-(y+2*k)*x)/(y*k) + exp(-k*x)/(k*k) + exp(-(y+k)*x)/(k*(y+k)) + exp(-2*(y+k)*x)/(2*y*(y+k)) + x/k + exp(-(y+2*k)*x)/(y*(y+2*k))) + f(x)

plot "MeanSqd_10_0.04405_1_0.1_0.dat" u 1:2 w p lt 6 ps 2.4 lw 4 lc rgb "blue" title sprintf("Simu N=10 b=0, {/Symbol f}=%g",phi),\
     "MeanSqd_10_0.04405_1_0.1_10.dat" u 1:2 w p lt 6 ps 2.4 lw 4 lc rgb "green" title sprintf("Simu N=10 b=%g, {/Symbol f}=%g",b,phi),\
     msd(x) lw 7 lc rgb "black" title "Analytical Biased MSD",\
     f(x) lw 7 lc rgb "red" title "Analytical Unbiased MSD"
