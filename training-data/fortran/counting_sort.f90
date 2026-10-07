subroutine counting_sort(arr, n, max_val)
    integer, intent(inout) :: arr(n)
    integer, intent(in) :: n, max_val
    integer :: count_arr(0:max_val)
    integer :: i, idx

    count_arr = 0
    do i = 1, n
        count_arr(arr(i)) = count_arr(arr(i)) + 1
    end do

    idx = 1
    do i = 0, max_val
        do while (count_arr(i) > 0)
            arr(idx) = i
            idx = idx + 1
            count_arr(i) = count_arr(i) - 1
        end do
    end do
end subroutine counting_sort

program main
    implicit none
    integer, parameter :: n = 8
    integer :: arr(n) = [4, 2, 2, 8, 3, 3, 1, 0]

    call counting_sort(arr, n, 8)
    print *, arr
end program main
