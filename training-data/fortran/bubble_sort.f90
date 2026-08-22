program bubble_sort
    implicit none
    integer :: arr(6) = [5, 2, 9, 1, 5, 6]
    integer :: i, j, tmp, n

    n = size(arr)
    do i = 1, n - 1
        do j = 1, n - i
            if (arr(j) > arr(j + 1)) then
                tmp = arr(j)
                arr(j) = arr(j + 1)
                arr(j + 1) = tmp
            end if
        end do
    end do
    print *, arr
end program bubble_sort
