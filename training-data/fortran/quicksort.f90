recursive subroutine quicksort(arr, low, high)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: low, high
    integer :: pivot, i, j, tmp

    if (low >= high) return
    pivot = arr((low + high) / 2)
    i = low
    j = high
    do while (i <= j)
        do while (arr(i) < pivot)
            i = i + 1
        end do
        do while (arr(j) > pivot)
            j = j - 1
        end do
        if (i <= j) then
            tmp = arr(i)
            arr(i) = arr(j)
            arr(j) = tmp
            i = i + 1
            j = j - 1
        end if
    end do
    call quicksort(arr, low, j)
    call quicksort(arr, i, high)
end subroutine quicksort

program main
    implicit none
    integer :: data(6) = [5, 3, 8, 1, 9, 2]
    call quicksort(data, 1, 6)
    print *, data
end program main
