module swapper
  interface swap
     module procedure swap_int, swap_real
  end interface
contains
  subroutine swap_int(a, b)
    integer, intent(inout) :: a, b
    integer :: t
    t = a; a = b; b = t
  end subroutine
  subroutine swap_real(a, b)
    real, intent(inout) :: a, b
    real :: t
    t = a; a = b; b = t
  end subroutine
end module swapper

program use_swap
  use swapper
  integer :: i = 1, j = 2
  real :: x = 1.5, y = 2.5
  call swap(i, j); call swap(x, y)
  print *, i, j, x, y
end program use_swap
