program hamming_weight
  implicit none
  integer :: n, c
  n = int(z'B7')
  c = 0
  do while (n /= 0)
    n = iand(n, n - 1)
    c = c + 1
  end do
  print *, c, popcnt(int(z'B7'))
end program hamming_weight
