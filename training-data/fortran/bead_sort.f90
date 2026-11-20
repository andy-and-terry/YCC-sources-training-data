! Bead (gravity) sort.
program bead_sort
  implicit none
  integer :: nums(5) = [5, 3, 1, 4, 2], cols(5), rows(5), i, r
  do i = 1, 5
    cols(i) = count(nums >= i)
  end do
  do r = 1, 5
    rows(6 - r) = count(cols >= r)
  end do
  print *, rows
end program bead_sort
