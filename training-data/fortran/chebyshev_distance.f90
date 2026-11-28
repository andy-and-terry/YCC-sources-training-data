program chebyshev_distance
  implicit none
  integer :: a(2) = [1, 2], b(2) = [4, 6]
  print *, maxval(abs(a - b))
end program chebyshev_distance
