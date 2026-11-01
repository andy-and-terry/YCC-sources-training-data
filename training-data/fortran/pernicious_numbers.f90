! Pernicious numbers: the popcount is prime.
program pernicious_numbers
  implicit none
  integer :: n
  do n = 1, 20
    if (is_prime(popcnt(n))) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function is_prime(k)
    integer, intent(in) :: k
    integer :: d
    is_prime = k >= 2
    d = 2
    do while (is_prime .and. d * d <= k)
      if (mod(k, d) == 0) is_prime = .false.
      d = d + 1
    end do
  end function is_prime
end program pernicious_numbers
