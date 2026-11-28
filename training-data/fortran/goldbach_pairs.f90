program goldbach_pairs
  implicit none
  integer :: p
  do p = 2, 14
    if (is_prime(p) .and. is_prime(28 - p)) print '(I0,A,I0)', p, ' + ', 28 - p
  end do
contains
  logical function is_prime(n)
    integer, intent(in) :: n
    integer :: d
    is_prime = n >= 2
    do d = 2, n - 1
      if (d * d > n) exit
      if (mod(n, d) == 0) is_prime = .false.
    end do
  end function is_prime
end program goldbach_pairs
