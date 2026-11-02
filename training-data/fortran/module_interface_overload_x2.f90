module shapes
  implicit none
  interface area
    module procedure area_circle, area_rect
  end interface
contains
  real function area_circle(r)
    real, intent(in) :: r
    area_circle = 3.14159 * r * r
  end function
  real function area_rect(w, h)
    real, intent(in) :: w, h
    area_rect = w * h
  end function
end module

program main
  use shapes
  print *, area(1.0), area(2.0, 3.0)
end program
