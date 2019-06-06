program FD
 implicit none 
 integer, parameter :: dp = selected_real_kind(15)
 real(dp), allocatable :: y(:),x(:)
 real(dp) :: dx,r1,r2,r3,l=1.0
 integer :: i,j,nodos

 nodos = 100.0
 dx = l/nodos
 allocate(y(nodos),x(nodos))

 y(1) = 0.0_dp; y(nodos) = 0.1_dp
 x(1) = 0.0_dp; x(nodos) = 0.0_dp

 open(1,file = "x.dat")
 open(2,file = "y.dat")

 do i = 2, nodos-1
  x(i) = i*dx
 end do 

 do j = 1, 1000
 do i = 2, nodos-1
  r1 = x(i+1)-x(i-1)
  r2 = x(i+1)-x(i)
  r3 = x(i)-x(i-1)
  y(i) = 2.0*(r2*r3)*((1/(r1*r2))*y(i+1)+(1/r1*r3)*y(i-1)+2.0*(3.0*x(i)-1.0))
 end do
 end do  

 
 write(*,*) y

end program