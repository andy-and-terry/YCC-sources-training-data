program container_most_water
  implicit none
  integer, parameter :: h(9) = [1, 8, 6, 2, 5, 4, 8, 3, 7]
  integer :: lo, hi, best
  lo = 1
  hi = size(h)
  best = 0
  do while (lo < hi)
    best = max(best, min(h(lo), h(hi)) * (hi - lo))
    if (h(lo) < h(hi)) then
      lo = lo + 1
    else
      hi = hi - 1
    end if
  end do
  print *, best  ! 49
end program container_most_water
