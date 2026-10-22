program narayana_cows_sequence
  implicit none
  ! Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
  integer(8) :: n(0:14)
  integer :: i

  n(0:2) = 1
  do i = 3, 14
     n(i) = n(i - 1) + n(i - 3)
  end do
  print '(15(I0,1X))', n
end program narayana_cows_sequence
