program ugly_numbers_merge
  implicit none
  integer, parameter :: n = 12
  integer(8) :: seq(n), c2, c3, c5, next
  integer :: i2, i3, i5, k
  seq(1) = 1
  i2 = 1; i3 = 1; i5 = 1
  do k = 2, n
    c2 = seq(i2) * 2; c3 = seq(i3) * 3; c5 = seq(i5) * 5
    next = min(c2, c3, c5)
    seq(k) = next
    if (next == c2) i2 = i2 + 1
    if (next == c3) i3 = i3 + 1
    if (next == c5) i5 = i5 + 1
  end do
  print '(12(i0,1x))', seq
end program ugly_numbers_merge
