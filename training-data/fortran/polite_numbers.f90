! Ways to write n as a sum of two or more consecutive positive integers.
program polite_numbers
  implicit none
  integer :: n
  do n = 1, 16
    write (*, '(I0,1X)', advance='no') polite_ways(n)
  end do
  print *
contains
  integer function polite_ways(k)
    integer, intent(in) :: k
    integer :: m
    polite_ways = 0
    m = 2
    do while (m * (m + 1) / 2 <= k)
      if (mod(k - m * (m - 1) / 2, m) == 0) polite_ways = polite_ways + 1
      m = m + 1
    end do
  end function polite_ways
end program polite_numbers
