module mathx
  implicit none
contains
  pure function hypot2(a, b) result(r)
    real, intent(in) :: a, b
    real :: r
    r = sqrt(a*a + b*b)
  end function hypot2
  recursive function fact(n) result(f)
    integer, intent(in) :: n
    integer :: f
    if (n <= 1) then
       f = 1
    else
       f = n * fact(n - 1)
    end if
  end function fact
end module mathx

program use_mathx
  use mathx
  print *, hypot2(3.0, 4.0), fact(6)
end program use_mathx
