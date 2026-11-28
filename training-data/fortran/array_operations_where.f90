program where_demo
  implicit none
  real :: a(5) = [1., -2., 3., -4., 5.]
  where (a < 0.) a = 0.
  print *, a
  print *, sum(a), maxval(a), count(a > 0.)
end program where_demo
