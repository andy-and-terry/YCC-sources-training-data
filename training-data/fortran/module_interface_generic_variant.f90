module ops
  implicit none
  interface double
    module procedure double_i, double_r
  end interface
contains
  integer function double_i(x); integer :: x; double_i = 2 * x; end function
  real function double_r(x); real :: x; double_r = 2.0 * x; end function
end module ops

program main
  use ops
  print *, double(3), double(1.5)
end program main
