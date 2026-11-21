! Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
program perfect_totient_numbers
  implicit none
  integer :: n, m, total
  do n = 2, 199
    total = 0
    m = n
    do while (m > 1)
      m = phi(m)
      total = total + m
    end do
    if (total == n) write (*, '(I0,1X)', advance='no') n
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

  integer function phi(n)
    integer, intent(in) :: n
    integer :: k
    phi = 0
    do k = 1, n
      if (gcd(k, n) == 1) phi = phi + 1
    end do
  end function phi
end program perfect_totient_numbers
