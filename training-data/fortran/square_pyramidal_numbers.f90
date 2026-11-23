! n(n+1)(2n+1)/6
program square_pyramidal_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', ((n * (n + 1)) * ((2 * n) + 1)) / 6
  end do
end program square_pyramidal_numbers
