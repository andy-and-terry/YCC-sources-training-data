program emirp_primes
  implicit none
  integer :: p
  do p = 2, 99
    if (is_prime(p) .and. rev(p) /= p .and. is_prime(rev(p))) write (*, '(I3)', advance='no') p
  end do
  print *
contains
  logical function is_prime(n)
    integer, intent(in) :: n
    integer :: i
    is_prime = n >= 2
    i = 2
    do while (is_prime .and. i * i <= n)
      if (mod(n, i) == 0) is_prime = .false.
      i = i + 1
    end do
  end function is_prime

  integer function rev(n)
    integer, intent(in) :: n
    integer :: m
    m = n
    rev = 0
    do while (m > 0)
      rev = rev * 10 + mod(m, 10)
      m = m / 10
    end do
  end function rev
end program emirp_primes
