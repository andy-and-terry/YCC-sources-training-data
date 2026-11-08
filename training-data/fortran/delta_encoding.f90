program delta_encoding
  implicit none
  integer :: xs(5) = [10, 12, 15, 15, 20]
  integer :: d(5)
  d(1) = xs(1)
  d(2:5) = xs(2:5) - xs(1:4)
  print '(5i4)', d
  print '(5i4)', [(sum(d(1:i)), i = 1, 5)]
end program delta_encoding
