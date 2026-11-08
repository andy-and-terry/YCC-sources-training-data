program secant_method
  implicit none
  double precision :: a = 1d0, b = 2d0, c
  integer :: i
  do i = 1, 40
     if (f(b) == f(a)) exit
     c = b - f(b) * (b - a) / (f(b) - f(a))
     a = b
     b = c
  end do
  print '(f12.8)', b
contains
  double precision function f(x)
    double precision, intent(in) :: x
    f = x * x - 2d0
  end function f
end program secant_method
