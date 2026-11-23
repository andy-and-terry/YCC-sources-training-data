! n(n+1)/2+1
program lazy_caterer_sequence
  implicit none
  integer :: n
  do n = 1, 15
     print '(i2, a, i7)', n, ' ->', ((n * (n + 1)) / 2) + 1
  end do
end program lazy_caterer_sequence
