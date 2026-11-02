program alloc_demo
  implicit none
  real, allocatable :: m(:,:)
  integer :: i
  allocate(m(3,3))
  m = 0.0
  do i = 1, 3
    m(i,i) = 1.0
  end do
  print *, trace(m)
contains
  real function trace(a)
    real, intent(in) :: a(:,:)
    integer :: k
    trace = 0.0
    do k = 1, size(a,1)
      trace = trace + a(k,k)
    end do
  end function
end program
