from numpy.linalg import slogdet
from numpy import zeros, loadtxt, exp


path = "data/"

A = [loadtxt(path+"LSE"+str(i+1)+"_A.dat") for i in range(5)]
b = [loadtxt(path+"LSE"+str(i+1)+"_b.dat") for i in range(5)]
det = [slogdet(A[i])[0]*slogdet(A[i])[1] for i in range(5)]

print("Determinant of A1 = ",det[0])
print("Determinant of A2 = ",det[1])
print("Determinant of A3 = ",det[2])
print("Determinant of A4 = ",det[3])
print("Determinant of A5 = ",det[4])