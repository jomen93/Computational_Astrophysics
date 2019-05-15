program main
 implicit none
 integer, parameter :: dp = selected_real_kind(15)
 real(dp), allocatable :: matrix(:,:), M(:,:)
 real(dp), allocatable :: b(:)
 integer :: i,j,k,l,n =10
 real(dp) :: mt,t,Det
 logical :: Exist = .true.
 
 open(1,file = "data/LSE1_A.dat", action='read')
 open(2,file = "data/LSE1_b.dat",status='old', action='read')
 
 allocate(matrix(n,n),M(n,n))
 allocate(b(n))
 
 read(1,*) matrix
 read(2,*) b

 M = matrix
 
 do k = 1,n-1
  if(M(k,k) == 0.0_dp)then
   write(*,*) "Zero diagonal component"
   Exist = .false.
   do i = k+1,n
    if(M(i,k)/=0.0_dp)then
     do j = 1,n
      t = M(i,j)
      M(i,j) = M(k,j)
      M(k,j) = t
     end do
     Exist = .true.
     l =-1
     exit
    end if
   end do 
   if(Exist .eqv. .false.)then
    Det = 0.0_dp
    write(*,*) "His determinat iz zero"
    return 
   end if
  end if 
  do j = k+1,n
   mt = M(j,k)/M(k,k)
   
   do i = k+1,n
    M(j,i) = M(j,i)-mt*M(k,i) 
    write(*,*) M(j,i)
   end do
  end do
 end do

 Det = 1.0_dp
 do i = 1,n
  Det = Det*M(i,i)
 end do 

 write(*,*) Det



end program main