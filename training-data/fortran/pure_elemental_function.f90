program elem_demo
  implicit none
  print *, square([1., 2., 3.])
contains
  elemental real function square(x)
    real, intent(in) :: x
    square = x * x
  end function
end program elem_demo
