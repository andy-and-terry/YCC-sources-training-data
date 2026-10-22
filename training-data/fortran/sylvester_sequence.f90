program sylvester_sequence
  implicit none
  ! Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
  ! integer(8) holds s(0)..s(6); stop updating before s(7) overflows.
  integer(8) :: s
  integer :: i

  s = 2
  do i = 0, 6
     print '(A,I0,A,I0)', 's(', i, ') = ', s
     if (i < 6) s = s * s - s + 1
  end do
end program sylvester_sequence
