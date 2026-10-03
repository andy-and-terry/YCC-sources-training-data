module quickselect_mod
    implicit none
contains
    function partition(arr, low, high) result(p)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: low, high
        integer :: p
        integer :: pivot, i, j, tmp

        pivot = arr(high)
        i = low - 1
        do j = low, high - 1
            if (arr(j) <= pivot) then
                i = i + 1
                tmp = arr(i)
                arr(i) = arr(j)
                arr(j) = tmp
            end if
        end do
        tmp = arr(i + 1)
        arr(i + 1) = arr(high)
        arr(high) = tmp
        p = i + 1
    end function partition

    recursive function quickselect(arr, low, high, k) result(res)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: low, high, k
        integer :: res
        integer :: p

        if (low == high) then
            res = arr(low)
            return
        end if

        p = partition(arr, low, high)

        if (k == p) then
            res = arr(p)
        else if (k < p) then
            res = quickselect(arr, low, p - 1, k)
        else
            res = quickselect(arr, p + 1, high, k)
        end if
    end function quickselect
end module quickselect_mod

program main
    use quickselect_mod
    implicit none
    integer :: data(6) = [7, 10, 4, 3, 20, 15]
    print *, quickselect(data, 1, 6, 3)
end program main
