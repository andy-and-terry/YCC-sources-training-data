! Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
program padovan_sequence
  implicit none
  integer, parameter :: n = 15
  integer :: p(0:n-1), i

  p(0:2) = 1
  do i = 3, n - 1
     p(i) = p(i-2) + p(i-3)
  end do
  print '(15(I0,1X))', p
end program padovan_sequence
