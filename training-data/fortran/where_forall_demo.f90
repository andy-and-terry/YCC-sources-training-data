program where_forall_demo
  implicit none
  integer :: a(6) = [1, -2, 3, -4, 5, -6], i
  where (a < 0) a = 0
  print *, a
  forall (i = 1:6) a(i) = a(i) * 2
  print *, a
end program where_forall_demo
