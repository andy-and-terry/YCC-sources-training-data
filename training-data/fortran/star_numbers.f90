! 6n(n-1)+1
program star_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', ((6 * n) * (n - 1)) + 1
  end do
end program star_numbers
