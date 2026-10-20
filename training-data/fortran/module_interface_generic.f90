module shapes
  implicit none
  interface area
     module procedure circle_area, rect_area
  end interface
contains
  real function circle_area(r)
    real, intent(in) :: r
    circle_area = 3.14159 * r * r
  end function
  real function rect_area(w, h)
    real, intent(in) :: w, h
    rect_area = w * h
  end function
end module shapes

program main
  use shapes
  print *, area(1.0), area(2.0, 3.0)
end program main
