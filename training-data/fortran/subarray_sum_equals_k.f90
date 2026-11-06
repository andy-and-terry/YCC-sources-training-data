! Count contiguous subarrays whose sum equals k (O(n^2) running sums).
program subarray_sum_equals_k
  implicit none
  integer, parameter :: nums(3) = [1, 1, 1]
  print '(I0)', count_subarrays(nums, 2)
contains
  integer function count_subarrays(a, k)
    integer, intent(in) :: a(:), k
    integer :: i, j, s
    count_subarrays = 0
    do i = 1, size(a)
      s = 0
      do j = i, size(a)
        s = s + a(j)
        if (s == k) count_subarrays = count_subarrays + 1
      end do
    end do
  end function count_subarrays
end program subarray_sum_equals_k
