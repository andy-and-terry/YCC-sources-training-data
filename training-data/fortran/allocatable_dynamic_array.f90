program dyn
  implicit none
  real, allocatable :: x(:)
  integer :: n = 5, i
  allocate(x(n))
  x = [(real(i)**2, i = 1, n)]
  print *, x
  deallocate(x)
end program dyn
