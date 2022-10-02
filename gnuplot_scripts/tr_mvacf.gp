reset
set encoding utf8
set log
set key Left
set key left
set key bottom

#set tics scale 3.0
set border linewidth 2.5
set format y "10^{%T}"
set format x "10^{%T}"
set key font ",20"
set key reverse
set key title "Significant Digits"

LW = 5
PS = 2
LT = 7

dataFile = "TrMeanVacf_10_0.04405_0_1.dat"

set term post enh col font "Latin_Modern_Roman" 22 size 20cm,16cm
set out "Tr_MVACF.eps"

phi=0
aux=0.04405
#aux=1.7425

g=10.0
#k=aux/phi
k=0.04405
q=0.1
y=1.0
b=1.0
delta=0.95

set yrange [0.001:30]
#set xrange [0.000001:1000000]

S = 2.*q*k*(y+2.*k)*(y+k) / (g+2.*q*k*(y+2.*k)*(y+k))
P = 1./(y+2.*k)


set xlabel "{/:Italic {/Symbol D} T}"
set ylabel "{/:Italic {/Symbol y}({/Symbol e},{/Symbol D} T)}"

psi1(x) = -(g/(2*(y+k)))*((exp(-(y+2*k)*x))/((y+2*k)*(y+2*k)))*(1-exp(-(y+2*k)*delta))*(1-exp((y+2*k)*delta))

psi2(x) = - (b*b/((y+k)*(y+k)))*(exp(-(k*x))/(k**2))*(1-exp(-k*delta))*(1-exp(k*delta))

mvacf(x) = (((1-exp(-y*delta))*(1-exp(-(y+2*k)*delta)))/(delta*delta*y*(y+2*k)))*((g/(2*(y+k)))*exp(-(y+2*k)*x))

f(x) = psi1(x)+psi2(x)


plot dataFile u 1:2 w lp lt LT ps PS lw LW lc rgb "blue" title "15",\
     dataFile every 2 u 1:3 w lp lt LT ps PS lw LW lc rgb "red" title "3",\
     dataFile every 2 u 1:4 w lp lt LT ps PS lw LW lc rgb "green" title "2",\
     f(x) lw (0.7*LW) lc rgb "black" title "analytical"
#     dataFile every 3 u 1:5 w lp lt LT ps PS lw LW lc rgb "black" title "1",\
#     f(x)
