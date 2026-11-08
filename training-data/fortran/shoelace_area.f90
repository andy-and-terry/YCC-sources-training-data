program shoelace_area
  implicit none
  real :: x(4) = [0., 4., 4., 0.], y(4) = [0., 0., 3., 3.]
  real :: s
  s = sum(x * y(cshift([1, 2, 3, 4], 1)) - x(cshift([1, 2, 3, 4], 1)) * y)
  print '(f6.2)', abs(s) / 2
end program shoelace_area
