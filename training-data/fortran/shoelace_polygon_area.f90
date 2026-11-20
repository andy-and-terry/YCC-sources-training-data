! Shoelace polygon area using cshift.
program shoelace_polygon_area
  implicit none
  real :: x(4) = [0., 4., 4., 0.], y(4) = [0., 0., 3., 3.]
  print *, abs(sum(x * cshift(y, 1) - cshift(x, 1) * y)) / 2
end program shoelace_polygon_area
