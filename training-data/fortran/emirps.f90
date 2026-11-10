program emirps
  implicit none
  integer :: n, r, count
  count = 0
  n = 2
  do while (count < 10)
    r = reverse_digits(n)
    if (r /= n .and. is_prime(n) .and. is_prime(r)) then
      write (*, '(I0,1X)', advance='no') n
      count = count + 1
    end if
    n = n + 1
  end do
  print *  ! 13 17 31 37 71 73 79 97 107 113
contains
  logical function is_prime(k)
    integer, intent(in) :: k
    integer :: i
    is_prime = k >= 2
    i = 2
    do while (is_prime .and. i * i <= k)
      if (mod(k, i) == 0) is_prime = .false.
      i = i + 1
    end do
  end function

  integer function reverse_digits(k)
    integer, intent(in) :: k
    integer :: x
    x = k
    reverse_digits = 0
    do while (x > 0)
      reverse_digits = reverse_digits * 10 + mod(x, 10)
      x = x / 10
    end do
  end function
end program emirps
