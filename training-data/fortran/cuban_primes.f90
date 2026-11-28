program cuban_primes
  implicit none
  integer :: y, found
  integer(8) :: p
  found = 0
  y = 1
  do while (found < 8)
    p = 3_8 * y * y + 3_8 * y + 1
    if (is_prime(p)) then
      write (*, '(I6)', advance='no') p
      found = found + 1
    end if
    y = y + 1
  end do
  print *
contains
  logical function is_prime(n)
    integer(8), intent(in) :: n
    integer(8) :: i
    is_prime = n >= 2
    i = 2
    do while (is_prime .and. i * i <= n)
      if (mod(n, i) == 0) is_prime = .false.
      i = i + 1
    end do
  end function is_prime
end program cuban_primes
