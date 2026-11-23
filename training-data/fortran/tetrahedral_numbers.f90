! n(n+1)(n+2)/6
program tetrahedral_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', ((n * (n + 1)) * (n + 2)) / 6
  end do
end program tetrahedral_numbers
