! 3n(n-1)+1
program centered_hexagonal_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', ((3 * n) * (n - 1)) + 1
  end do
end program centered_hexagonal_numbers
