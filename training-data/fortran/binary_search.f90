program binary_search
    implicit none
    integer :: sorted(7) = [1, 3, 5, 7, 9, 11, 13]
    print *, search(sorted, 7)
    print *, search(sorted, 4)

contains

    function search(arr, target) result(idx)
        integer, intent(in) :: arr(:)
        integer, intent(in) :: target
        integer :: idx, low, high, mid

        low = 1
        high = size(arr)
        idx = -1
        do while (low <= high)
            mid = (low + high) / 2
            if (arr(mid) == target) then
                idx = mid
                return
            else if (arr(mid) < target) then
                low = mid + 1
            else
                high = mid - 1
            end if
        end do
    end function search

end program binary_search
