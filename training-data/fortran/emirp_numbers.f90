! Emirps: primes whose digit reversal is a different prime.
program emirp_numbers
  implicit none
  integer :: n, r
  do n = 2, 99
    r = reverse_digits(n)
    if (r /= n .and. is_prime(n) .and. is_prime(r)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function is_prime(x)
    integer, intent(in) :: x
    integer :: i
    is_prime = x >= 2
    i = 2
    do while (i * i <= x)
      if (mod(x, i) == 0) is_prime = .false.
      i = i + 1
    end do
  end function is_prime

  integer function reverse_digits(x)
    integer, intent(in) :: x
    integer :: t
    t = x
    reverse_digits = 0
    do while (t > 0)
      reverse_digits = reverse_digits * 10 + mod(t, 10)
      t = t / 10
    end do
  end function reverse_digits
end program emirp_numbers
