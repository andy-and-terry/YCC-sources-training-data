! n^2(n+1)/2
program pentagonal_pyramidal_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', ((n * n) * (n + 1)) / 2
  end do
end program pentagonal_pyramidal_numbers
