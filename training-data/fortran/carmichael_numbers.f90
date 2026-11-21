! Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
program carmichael_numbers
  implicit none
  integer :: n
  do n = 3, 2999, 2
    if (is_carmichael(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  integer function gcd(a, b)
    integer, intent(in) :: a, b
    integer :: x, y, t
    x = a
    y = b
    do while (y /= 0)
      t = mod(x, y)
      x = y
      y = t
    end do
    gcd = x
  end function gcd

  integer(8) function pow_mod(b, e, m)
    integer, intent(in) :: b, e, m
    integer(8) :: base, r
    integer :: ex
    base = mod(b, m)
    r = 1
    ex = e
    do while (ex > 0)
      if (mod(ex, 2) == 1) r = mod(r * base, int(m, 8))
      base = mod(base * base, int(m, 8))
      ex = ex / 2
    end do
    pow_mod = r
  end function pow_mod

  logical function is_prime(n)
    integer, intent(in) :: n
    integer :: p
    is_prime = n > 1
    p = 2
    do while (p * p <= n)
      if (mod(n, p) == 0) then
        is_prime = .false.
        return
      end if
      p = p + 1
    end do
  end function is_prime

  logical function is_carmichael(n)
    integer, intent(in) :: n
    integer :: a
    is_carmichael = .false.
    if (is_prime(n)) return
    do a = 2, n - 1
      if (gcd(a, n) == 1 .and. pow_mod(a, n - 1, n) /= 1) return
    end do
    is_carmichael = .true.
  end function is_carmichael
end program carmichael_numbers
