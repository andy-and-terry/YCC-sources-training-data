! Twin primes below 100; expect 8.
program twin_primes
  implicit none
  integer :: c, p, n

  c = 0
  do p = 2, 99
    if (is_prime(p) .and. is_prime(p + 2)) c = c + 1
  end do
  print '(I0)', c
contains
  logical function is_prime(n)
    integer, intent(in) :: n
    integer :: d
    is_prime = .false.
    if (n < 2) return
    is_prime = .true.
    d = 2
    do while (d * d <= n)
      if (mod(n, d) == 0) then
        is_prime = .false.
        return
      end if
      d = d + 1
    end do
  end function is_prime
end program twin_primes
