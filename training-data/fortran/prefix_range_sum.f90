program prefix_range_sum
  implicit none
  integer :: values(8) = [3, 1, 4, 1, 5, 9, 2, 6]
  integer :: prefix(0:8)

  prefix(0) = 0
  prefix(1:8) = [(sum(values(1:i)), i = 1, 8)]
  print '(i0)', prefix(5) - prefix(2)
end program prefix_range_sum
