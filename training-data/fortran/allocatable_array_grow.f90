program allocatable_array_grow
  implicit none
  integer, allocatable :: a(:)
  integer :: i
  allocate(a(3)); a = [1, 2, 3]
  a = [a, 4]
  print *, size(a), a
  deallocate(a)
end program allocatable_array_grow
