program secant_method
  implicit none
  double precision :: x0 = 1d0, x1 = 2d0, f0, f1, nxt
  integer :: i
  do i = 1, 50
    f0 = x0 * x0 - 2d0
    f1 = x1 * x1 - 2d0
    if (f1 == f0) exit
    nxt = x1 - f1 * (x1 - x0) / (f1 - f0)
    x0 = x1
    x1 = nxt
    if (abs(x1 - x0) < 1d-12) exit
  end do
  print '(F14.10)', x1
end program secant_method
