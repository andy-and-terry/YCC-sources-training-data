! Manhattan distance of two vectors.
program manhattan_distance
  implicit none
  integer :: a(2) = [1, 2], b(2) = [4, 6]
  print *, sum(abs(a - b))
end program manhattan_distance
