program elem
  implicit none
  print *, cube([1.0, 2.0, 3.0])
contains
  elemental real function cube(x)
    real, intent(in) :: x
    cube = x**3
  end function
end program
