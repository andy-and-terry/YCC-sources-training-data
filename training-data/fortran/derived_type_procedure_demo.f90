module circle_mod
  implicit none
  type :: circle
    real :: r
  contains
    procedure :: area
  end type circle
contains
  real function area(self)
    class(circle), intent(in) :: self
    area = 3.14159 * self%r**2
  end function area
end module circle_mod

program derived_type_procedure_demo
  use circle_mod
  implicit none
  type(circle) :: c
  c = circle(2.0)
  print '(F8.3)', c%area()
end program derived_type_procedure_demo
