module shapes
  implicit none
  type :: rect
     real :: w, h
   contains
     procedure :: area => rect_area
  end type rect
contains
  real function rect_area(self)
    class(rect), intent(in) :: self
    rect_area = self%w * self%h
  end function rect_area
end module shapes
program main
  use shapes
  type(rect) :: r = rect(2.0, 3.0)
  print *, r%area()
end program main
