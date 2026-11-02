program derived_demo
  implicit none
  type :: vec
    real :: x, y
  contains
    procedure :: norm
  end type
  type(vec) :: v
  v = vec(3.0, 4.0)
  print *, v%norm()
contains
  real function norm(self)
    class(vec), intent(in) :: self
    norm = sqrt(self%x**2 + self%y**2)
  end function
end program
