program pronic_numbers
  implicit none
  integer :: n

  do n = 0, 9
     write (*, '(I0,1X)', advance='no') n * (n + 1)
  end do
  print *                          ! 0 2 6 12 20 30 42 56 72 90
  print *, is_pronic(56), is_pronic(57)  ! T F

contains

  logical function is_pronic(x)
    integer, intent(in) :: x
    integer :: r
    r = int(sqrt(real(x)))
    is_pronic = (r * (r + 1) == x)
  end function is_pronic
end program pronic_numbers
