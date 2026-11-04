program heron_area
  implicit none
  print '(f8.3)', heron(3.0, 4.0, 5.0)
  print '(f8.3)', heron(6.0, 7.0, 8.0)
contains
  pure real function heron(a, b, c)
    real, intent(in) :: a, b, c
    real :: s
    s = (a + b + c) / 2.0
    heron = sqrt(s * (s - a) * (s - b) * (s - c))
  end function heron
end program heron_area
