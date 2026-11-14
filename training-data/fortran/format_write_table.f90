program fmt_demo
  implicit none
  integer :: i
  do i = 1, 3
    write (*, '(I3, 2X, F8.3, 2X, ES10.2)') i, sqrt(real(i)), 1000.0 * i
  end do
end program fmt_demo
