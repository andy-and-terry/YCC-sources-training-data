module heap_sort_mod
    implicit none
contains
    recursive subroutine heapify(arr, n, i)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: n, i
        integer :: largest, left, right, temp
        largest = i
        left = 2 * i
        right = 2 * i + 1
        if (left <= n .and. arr(left) > arr(largest)) largest = left
        if (right <= n .and. arr(right) > arr(largest)) largest = right
        if (largest /= i) then
            temp = arr(i)
            arr(i) = arr(largest)
            arr(largest) = temp
            call heapify(arr, n, largest)
        end if
    end subroutine heapify

    subroutine heap_sort(arr, n)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: n
        integer :: i, temp
        do i = n / 2, 1, -1
            call heapify(arr, n, i)
        end do
        do i = n, 2, -1
            temp = arr(1)
            arr(1) = arr(i)
            arr(i) = temp
            call heapify(arr, i - 1, 1)
        end do
    end subroutine heap_sort
end module heap_sort_mod

program main
    use heap_sort_mod
    implicit none
    integer, parameter :: n = 6
    integer :: arr(n) = [5, 3, 8, 1, 9, 2]
    call heap_sort(arr, n)
    print *, arr
end program main
