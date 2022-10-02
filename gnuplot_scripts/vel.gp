reset

set samples 1000
set encoding utf8
set border linewidth 2.5
set key font ",18"

set xlabel "{/:Italic v_{||}}"
set ylabel "{/:Italic P(v_{||})}"

file = "hist_vpar_10_0.04405.dat"

EV = 6
LW = 6

set term post enh col font "Latin_Modern_Roman" 22 size 20cm,16cm
set out "VPDF.eps"

y=1
k=0.04405
pi=3.14159265359
b=10
g=10

set xrange [-5:25]

f(x) = (((y+k)/(pi*g))**0.5)*exp(-((y+k)*(x-b/(y+k))**2)/(g))

plot file every EV ls 7 linecolor rgb "red" pointsize 2 notitle,\
     f(x) lw LW linecolor rgb "black"  notitle


