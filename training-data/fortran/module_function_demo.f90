module mathx
  implicit none
contains
  pure function square(x) result(r)
    real, intent(in) :: x
    real :: r
    r = x * x
  end function square
end module mathx

program use_mathx
  use mathx
  print *, square(4.0)
end program use_mathx
