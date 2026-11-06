! Amicable pairs: d(a) == b and d(b) == a with a /= b.
program amicable_pairs
  implicit none
  integer :: a, b
  do a = 2, 1499
    b = d(a)
    if (b > a) then
      if (d(b) == a) print '(I0,1X,I0)', a, b
    end if
  end do
contains
  integer function d(n)
    integer, intent(in) :: n
    integer :: i
    d = 0
    do i = 1, n - 1
      if (mod(n, i) == 0) d = d + i
    end do
  end function d
end program amicable_pairs
