program array_ops
  implicit none
  integer :: a(5) = [1, 2, 3, 4, 5]
  print *, a(2:4)
  print *, a * 2
  print *, sum(a), maxval(a), count(a > 2)
end program array_ops
