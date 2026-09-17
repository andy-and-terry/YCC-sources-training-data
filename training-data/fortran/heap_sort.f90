module heap_sort_mod
    implicit none
contains
    recursive subroutine sift_down(arr, root, heap_size)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: root, heap_size
        integer :: largest, left, right, temp

        largest = root
        left = 2 * root
        right = 2 * root + 1

        if (left <= heap_size .and. arr(left) > arr(largest)) largest = left
        if (right <= heap_size .and. arr(right) > arr(largest)) largest = right

        if (largest /= root) then
            temp = arr(root)
            arr(root) = arr(largest)
            arr(largest) = temp
            call sift_down(arr, largest, heap_size)
        end if
    end subroutine sift_down

    subroutine heap_sort(arr)
        integer, intent(inout) :: arr(:)
        integer :: n, i, temp

        n = size(arr)
        do i = n / 2, 1, -1
            call sift_down(arr, i, n)
        end do

        do i = n, 2, -1
            temp = arr(1)
            arr(1) = arr(i)
            arr(i) = temp
            call sift_down(arr, 1, i - 1)
        end do
    end subroutine heap_sort
end module heap_sort_mod

program main
    use heap_sort_mod
    implicit none
    integer :: arr(8) = [8, 3, 5, 1, 9, 2, 7, 4]

    call heap_sort(arr)
    print *, arr
end program main
