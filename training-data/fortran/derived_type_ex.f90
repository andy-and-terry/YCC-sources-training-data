program derived_type_ex
  implicit none
  type :: point
     real :: x, y
  end type point
  type(point) :: p, q
  p = point(3.0, 4.0)
  q = point(x=1.0, y=2.0)
  print *, sqrt(p%x**2 + p%y**2)
  print *, q
end program derived_type_ex
