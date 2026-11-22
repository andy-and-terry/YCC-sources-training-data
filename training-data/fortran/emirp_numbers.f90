! Emirps: primes whose digit reversal is a different prime.
program emirp_numbers
  implicit none
  integer :: n, r
  do n = 2, 199
    r = reverse_num(n)
    if (r /= n .and. is_prime(n) .and. is_prime(r)) write (*, '(I0,1X)', advance='no') n
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

  integer function reverse_num(n)
    integer, intent(in) :: n
    integer :: m
    m = n
    reverse_num = 0
    do while (m > 0)
      reverse_num = reverse_num * 10 + mod(m, 10)
      m = m / 10
    end do
  end function reverse_num
end program emirp_numbers
