program list_mode
  implicit none
  integer :: items(6) = [1, 2, 2, 3, 3, 4]
  integer :: counts(0:9), v, top

  counts = 0
  do v = 1, size(items)
     counts(items(v)) = counts(items(v)) + 1
  end do
  top = maxval(counts)
  do v = 0, 9
     if (counts(v) == top) write (*, '(i0, 1x)', advance='no') v
  end do
  print *
end program list_mode
