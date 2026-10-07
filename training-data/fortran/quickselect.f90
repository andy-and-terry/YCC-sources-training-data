module quickselect_mod
    implicit none
contains
    recursive integer function quickselect(arr, lo, hi, k) result(res)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: lo, hi, k
        integer :: pivot, i, j, tmp
        pivot = arr(hi)
        i = lo
        do j = lo, hi - 1
            if (arr(j) <= pivot) then
                tmp = arr(i); arr(i) = arr(j); arr(j) = tmp
                i = i + 1
            end if
        end do
        tmp = arr(i); arr(i) = arr(hi); arr(hi) = tmp
        if (k == i) then
            res = arr(i)
        else if (k < i) then
            res = quickselect(arr, lo, i - 1, k)
        else
            res = quickselect(arr, i + 1, hi, k)
        end if
    end function quickselect
end module quickselect_mod

program main
    use quickselect_mod
    implicit none
    integer :: arr(7) = [7, 10, 4, 3, 20, 15, 2]

    print *, quickselect(arr, 1, 7, 4)
end program main
