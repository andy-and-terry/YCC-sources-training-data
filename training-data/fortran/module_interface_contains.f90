module geom
  implicit none
contains
  pure function area(r) result(a)
    real, intent(in) :: r
    real :: a
    a = 3.14159 * r * r
  end function area
end module geom
program main
  use geom
  print '(f8.3)', area(2.0)
end program main
