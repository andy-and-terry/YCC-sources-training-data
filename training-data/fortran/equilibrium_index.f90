program equilibrium_index
  implicit none
  integer, parameter :: nums(6) = [1, 7, 3, 6, 5, 6]
  integer :: i, total, left, found
  total = sum(nums)
  left = 0
  found = -1
  do i = 1, size(nums)
    if (found < 0 .and. left == total - left - nums(i)) found = i - 1
    left = left + nums(i)
  end do
  print *, found  ! 3
end program equilibrium_index
