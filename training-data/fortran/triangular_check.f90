! n is triangular iff 8n + 1 is a perfect square.
program triangular_check
  implicit none
  integer :: n
  do n = 0, 20
    if (is_triangular(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function is_triangular(k)
    integer, intent(in) :: k
    integer :: s, r
    s = 8 * k + 1
    r = nint(sqrt(real(s)))
    is_triangular = (r * r == s)
  end function is_triangular
end program triangular_check
