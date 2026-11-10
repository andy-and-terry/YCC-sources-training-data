program sophie_germain_primes
  implicit none
  integer :: p, count
  count = 0
  p = 2
  do while (count < 10)
    if (is_prime(p) .and. is_prime(2 * p + 1)) then
      write (*, '(I0,1X)', advance='no') p
      count = count + 1
    end if
    p = p + 1
  end do
  print *  ! 2 3 5 11 23 29 41 53 83 89
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
end program sophie_germain_primes
