program four_sum_count
  implicit none
  integer, parameter :: a(2) = [1, 2], b(2) = [-2, -1], c(2) = [-1, 2], d(2) = [0, 2]
  integer :: i, j, k, l, count
  count = 0
  do i = 1, 2
    do j = 1, 2
      do k = 1, 2
        do l = 1, 2
          if (a(i) + b(j) + c(k) + d(l) == 0) count = count + 1
        end do
      end do
    end do
  end do
  print *, count  ! 2
end program four_sum_count
