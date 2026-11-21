! Amicable pairs below 1500 via sums of proper divisors.
program amicable_pairs
  implicit none
  integer :: a, b
  do a = 2, 1499
    b = s(a)
    if (b > a) then
      if (s(b) == a) print '(I0,1X,I0)', a, b
    end if
  end do
contains
  integer function s(n)
    integer, intent(in) :: n
    integer :: d
    s = 0
    do d = 1, n - 1
      if (mod(n, d) == 0) s = s + d
    end do
  end function s
end program amicable_pairs
