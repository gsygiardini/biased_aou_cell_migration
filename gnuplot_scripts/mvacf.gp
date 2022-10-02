reset

set log

b=10
k=0.04405
d=2
y=1
f(x) = ((b**2)/((y+k)**2))*((1/(k**2)))*(exp(-k*x))*(1-exp(-k*d))*(1-exp(k*d))


plot f(x),\
     'MeanSqd_10_0.04405_1_0_10.dat' u 1:3 w lp
