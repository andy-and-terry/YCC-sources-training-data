program perfect_square_check
  implicit none
  integer :: n

  do n = 0, 29
     if (is_perfect_square(n)) write (*, '(i0, 1x)', advance='no') n
  end do
  print *

contains

  logical function is_perfect_square(k)
    integer, intent(in) :: k
    integer :: r
    r = nint(sqrt(real(k)))
    is_perfect_square = (k >= 0 .and. r * r == k)
  end function is_perfect_square

end program perfect_square_check
