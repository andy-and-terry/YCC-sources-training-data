program masked
  implicit none
  integer :: a(6) = [-2, 3, -1, 4, 0, 5], i
  where (a < 0) a = 0
  print *, a
  forall (i = 1:6) a(i) = a(i) * i
  print *, a
end program masked
