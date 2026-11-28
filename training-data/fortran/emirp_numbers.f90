program emirp_numbers
  implicit none
  integer :: p, r

  do p = 2, 199
     r = reverse_digits(p)
     if (r /= p .and. is_prime(p) .and. is_prime(r)) write (*, '(I0,1X)', advance='no') p
  end do
  print *  ! 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199

contains

  logical function is_prime(x)
    integer, intent(in) :: x
    integer :: i
    is_prime = x >= 2
    i = 2
    do while (is_prime .and. i * i <= x)
       if (mod(x, i) == 0) is_prime = .false.
       i = i + 1
    end do
  end function is_prime

  integer function reverse_digits(x)
    integer, intent(in) :: x
    integer :: m
    m = x
    reverse_digits = 0
    do while (m > 0)
       reverse_digits = reverse_digits * 10 + mod(m, 10)
       m = m / 10
    end do
  end function reverse_digits
end program emirp_numbers
