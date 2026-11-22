! Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
program twin_primes
  implicit none
  integer :: p
  do p = 2, 99
    if (is_prime(p) .and. is_prime(p + 2)) write (*, '(I0,1X)', advance='no') p
  end do
  print *
contains
  logical function is_prime(n)
    integer, intent(in) :: n
    integer :: d
    is_prime = n >= 2
    d = 2
    do while (is_prime .and. d * d <= n)
      if (mod(n, d) == 0) is_prime = .false.
      d = d + 1
    end do
  end function is_prime
end program twin_primes
