import numpy as np
import matplotlib.pyplot as plt

L = 6.957e8
alpha = 1408
m = 1.989e30
G = 6.674e-11
p = 2.466e16
k = 1.244e14
gamma = 4/3.

A = (G*m*alpha)/(p*L)
B = (4*np.pi*alpha*L**3)/m
C = (1/alpha)*(p/k)**(1/gamma)



n = 1000
LL = 1500e3
dx = LL/n
r = np.array([ i*dx for i in range(n)])
r[0] = 0.8*r[1]+0.2*r[2]
M = np.zeros(n+1)
P = np.zeros(n+1)
rho = np.zeros(n+1)

rho[0] = 10e13/alpha
P[0] = (10e13/alpha/C)**gamma*1e-10
M[0] = 0# this's weird

#Pr =[]; Mass = []; Rho = []
for i in range(n-1):
    M[i+1] = M[i] + B*(r[i+1]-r[i])*rho[i]*r[i]**2
    P[i+1] = P[i] - A*(r[i+1]-r[i])*M[i]/(r[i]**2)
    rho[i+1] = C*(P[i]**(1/gamma))


print(rho)