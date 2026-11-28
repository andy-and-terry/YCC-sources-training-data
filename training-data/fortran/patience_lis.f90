program patience_lis
  implicit none
  integer :: a(8) = [10, 9, 2, 5, 3, 7, 101, 18]
  integer :: tails(8), len, i, lo, hi, mid
  len = 0
  do i = 1, size(a)
     lo = 1
     hi = len + 1
     do while (lo < hi)
        mid = (lo + hi) / 2
        if (tails(mid) < a(i)) then
           lo = mid + 1
        else
           hi = mid
        end if
     end do
     tails(lo) = a(i)
     if (lo > len) len = lo
  end do
  print *, len
end program patience_lis
