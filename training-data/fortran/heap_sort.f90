module heap_sort_mod
    implicit none
contains
    subroutine sift_down(arr, n, root)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: n, root
        integer :: largest, left, right, temp, cur
        cur = root
        do
            largest = cur
            left = 2 * cur
            right = 2 * cur + 1
            if (left <= n) then
                if (arr(left) > arr(largest)) largest = left
            end if
            if (right <= n) then
                if (arr(right) > arr(largest)) largest = right
            end if
            if (largest == cur) exit
            temp = arr(cur)
            arr(cur) = arr(largest)
            arr(largest) = temp
            cur = largest
        end do
    end subroutine sift_down

    subroutine heap_sort(arr)
        integer, intent(inout) :: arr(:)
        integer :: n, i, temp
        n = size(arr)
        do i = n / 2, 1, -1
            call sift_down(arr, n, i)
        end do
        do i = n, 2, -1
            temp = arr(1)
            arr(1) = arr(i)
            arr(i) = temp
            call sift_down(arr, i - 1, 1)
        end do
    end subroutine heap_sort
end module heap_sort_mod

program main
    use heap_sort_mod
    implicit none
    integer :: arr(6) = [6, 3, 8, 1, 9, 2]
    call heap_sort(arr)
    print *, arr
end program main
