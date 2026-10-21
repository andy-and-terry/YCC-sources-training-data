program pell_numbers
  implicit none
  ! P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
  integer(8) :: a, b, t
  integer :: i

  a = 0
  b = 1
  do i = 0, 14
     print '(A,I0,A,I0)', 'P(', i, ') = ', a
     t = 2 * b + a
     a = b
     b = t
  end do
end program pell_numbers
