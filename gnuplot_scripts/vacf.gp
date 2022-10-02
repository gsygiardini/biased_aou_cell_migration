reset

set log

g=10
b=10
y=1
k=0.04405

set xrange [1e-4:100]

f(x) = (g/(2*(y+k)))*exp(-(y+2*k)*x) + ((b**2)/((y+k)**2))*exp(-k*x)
g(x) = (g/(2*(y+k)))*exp(-(y+2*k)*x)
plot f(x) title "Biased VACF",\
     g(x) title "Normal VACF"
