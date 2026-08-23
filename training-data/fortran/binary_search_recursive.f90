recursive function binary_search(arr, low, high, target) result(idx)
    integer, intent(in) :: arr(:), low, high, target
    integer :: idx, mid

    if (low > high) then
        idx = -1
        return
    end if

    mid = (low + high) / 2
    if (arr(mid) == target) then
        idx = mid
    else if (arr(mid) < target) then
        idx = binary_search(arr, mid + 1, high, target)
    else
        idx = binary_search(arr, low, mid - 1, target)
    end if
end function binary_search

program main
    implicit none
    integer :: binary_search
    integer :: data(6) = [1, 3, 5, 7, 9, 11]
    print *, binary_search(data, 1, 6, 7)
end program main
