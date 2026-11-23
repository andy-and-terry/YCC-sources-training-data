! n(n+1)(n+2)(n+3)/24
program pentatope_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24
  end do
end program pentatope_numbers
