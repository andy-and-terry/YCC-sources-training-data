subroutine selection_sort(arr, n)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: n
    integer :: i, j, min_idx, tmp

    do i = 1, n - 1
        min_idx = i
        do j = i + 1, n
            if (arr(j) < arr(min_idx)) min_idx = j
        end do
        tmp = arr(i)
        arr(i) = arr(min_idx)
        arr(min_idx) = tmp
    end do
end subroutine selection_sort

program main
    implicit none
    integer :: data(6) = [5, 3, 8, 1, 9, 2]
    call selection_sort(data, 6)
    print *, data
end program main
