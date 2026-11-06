! Highest value reached by the Collatz (hailstone) sequence from n.
program hailstone_peak
  implicit none
  print '(I0)', peak(27_8)
contains
  integer(8) function peak(start)
    integer(8), intent(in) :: start
    integer(8) :: n
    n = start
    peak = n
    do while (n /= 1)
      if (mod(n, 2_8) == 0) then
        n = n / 2
      else
        n = 3 * n + 1
      end if
      peak = max(peak, n)
    end do
  end function peak
end program hailstone_peak
