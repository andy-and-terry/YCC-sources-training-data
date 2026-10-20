program where_demo
  implicit none
  real :: x(5) = [-1., 2., -3., 4., 5.]
  where (x < 0) x = 0
  print *, x
end program where_demo
