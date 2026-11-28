program alloc_demo
  implicit none
  integer, allocatable :: a(:)
  integer :: i
  allocate(a(5))
  a = [(i * i, i = 1, 5)]
  print *, a
  deallocate(a)
end program alloc_demo
