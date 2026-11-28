program pollard_rho
  implicit none
  integer(8) :: n, p
  n = 8051
  p = rho(n)
  print '(i0,a,i0,a,i0)', n, ' = ', p, ' * ', n / p
contains
  integer(8) function gcd(a, b)
    integer(8), intent(in) :: a, b
    integer(8) :: x, y, t
    x = a; y = b
    do while (y /= 0)
       t = mod(x, y); x = y; y = t
    end do
    gcd = x
  end function gcd

  integer(8) function rho(n)
    integer(8), intent(in) :: n
    integer(8) :: x, y, d
    x = 2; y = 2; d = 1
    do while (d == 1)
       x = mod(x * x + 1, n)
       y = mod(y * y + 1, n)
       y = mod(y * y + 1, n)
       d = gcd(abs(x - y), n)
    end do
    rho = d
  end function rho
end program pollard_rho
