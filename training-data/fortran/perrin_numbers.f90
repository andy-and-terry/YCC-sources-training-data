program perrin_numbers
  implicit none
  ! Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
  integer(8) :: p(0:14)
  integer :: n

  p(0) = 3
  p(1) = 0
  p(2) = 2
  do n = 3, 14
     p(n) = p(n - 2) + p(n - 3)
  end do
  print '(15(I0,1X))', p
end program perrin_numbers
