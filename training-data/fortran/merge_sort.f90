recursive subroutine merge_sort(arr, low, high)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: low, high
    integer :: mid

    if (low >= high) return
    mid = (low + high) / 2
    call merge_sort(arr, low, mid)
    call merge_sort(arr, mid + 1, high)
    call merge(arr, low, mid, high)
end subroutine merge_sort

subroutine merge(arr, low, mid, high)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: low, mid, high
    integer :: temp(high - low + 1)
    integer :: i, j, k

    i = low
    j = mid + 1
    k = 1
    do while (i <= mid .and. j <= high)
        if (arr(i) <= arr(j)) then
            temp(k) = arr(i)
            i = i + 1
        else
            temp(k) = arr(j)
            j = j + 1
        end if
        k = k + 1
    end do
    do while (i <= mid)
        temp(k) = arr(i)
        i = i + 1
        k = k + 1
    end do
    do while (j <= high)
        temp(k) = arr(j)
        j = j + 1
        k = k + 1
    end do
    arr(low:high) = temp
end subroutine merge

program main
    implicit none
    integer :: data(6) = [5, 2, 9, 1, 5, 6]
    call merge_sort(data, 1, 6)
    print *, data
end program main
