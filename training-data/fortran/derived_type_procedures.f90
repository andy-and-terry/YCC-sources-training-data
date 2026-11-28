module shapes
  implicit none
  type :: rect
    real :: w, h
  contains
    procedure :: area
  end type
contains
  real function area(self)
    class(rect), intent(in) :: self
    area = self%w * self%h
  end function
end module shapes

program main
  use shapes
  type(rect) :: r = rect(2.0, 3.0)
  print *, r%area()
end program main
