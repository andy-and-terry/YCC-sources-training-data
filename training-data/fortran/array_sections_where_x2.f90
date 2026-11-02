program where_demo
  implicit none
  integer :: a(8) = [3, -1, 4, -1, 5, -9, 2, 6]
  where (a < 0) a = 0
  print *, a
  print *, sum(a(2:6)), maxval(a)
end program
