! 2n(n-1)+1
program centered_square_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', ((2 * n) * (n - 1)) + 1
  end do
end program centered_square_numbers
