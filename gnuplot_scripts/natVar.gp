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
set key reverse

LW = 5
PS = 2
LT = 7

dataFile = "MeanSqd_20_0.04405_1_0_1.dat"

#set term post enh col font "Latin_Modern_Roman" 22 size 20cm,16cm
#set out "conta_msd.eps"

phi=0
aux=0.04405
#aux=1.7425

g=10.0
#k=aux/phi
k=100 #k=0.04405
q=0.1
y=1.0
b=1.0



S = 2.*q*k*(y+2.*k)*(y+k) / (g+2.*q*k*(y+2.*k)*(y+k))
P = 1./(y+2.*k)

#set xrange [S/10:1000*P]
set xrange [0.000001:1000]

set xlabel "{/:Italic {/Symbol D} T}"
set ylabel "{/:Italic MSD({/Symbol D} T)}"


unbias(x) = (g/((y+2.*k)*(y+k)))*(x - (1./(y+2.*k))*(1. - exp(-(y+2.*k)*x)) ) + 2.*q*k*x #MSD Normal

unbias1(x) = (g/((y+2.*k)*(y+k)))*(x - (1-exp(-k*x))/k) + 2.*q*k*x #MSD Normal

msd1(x) = ((2*b*b)/(2*y*(y+k)*(y+k)*(y+k)))*(1-exp(-2*(y+k)*x))

msd2(x) = ((2*b*b)/(y*k*(y+k)*(y+2*k))) * (1-exp(-(y+2*k)*x))

msd3(x) = ((2*b*b)/(k*(y+k)*(y+k))) * (x - (1-exp(-k*x))/k)

msd4(x) = ((2*b*b)/(k*(y+k)*(y+k)*(y+k))) * (1-exp(-(y+k)*x))

bias(x) = unbias(x) - msd1(x) + msd2(x) + msd3(x) - msd4(x)

test(x) = unbias(x) + msd3(x)


#plot bias(x) w p lc rgb "blue" title "Analytical Biased",\
#     unbias(x) lc rgb "black" title "Analytical Unbiased",\
#     msd3(x) lc rgb "purple" title "exp(-k T)",\
#     test(x) lc rgb "blue" title "test",\
#     "MeanSqd_1_0.04405_10_0_1.dat" w p title "simu1"
     #msd1(x) lc rgb "green" title "-exp(-2(y+k) T)",\
     #msd2(x) lc rgb "red" title "exp(-(y+2k) T)",\
     #msd4(x) lc rgb "brown" title "-exp(-(y+k) T)"

plot exp(-2*(y+k)*x) ,\
     exp(-(y+2*k)*x) ,\
     exp(-(y+k)*x) ,\
     exp(-k*x)
