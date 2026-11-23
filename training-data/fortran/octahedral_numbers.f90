! n(2n^2+1)/3
program octahedral_numbers
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', (n * (((2 * n) * n) + 1)) / 3
  end do
end program octahedral_numbers
