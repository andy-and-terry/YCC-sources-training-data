subroutine insertion_sort(arr, n)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: n
    integer :: i, j, key

    do i = 2, n
        key = arr(i)
        j = i - 1
        do while (j >= 1 .and. arr(j) > key)
            arr(j + 1) = arr(j)
            j = j - 1
        end do
        arr(j + 1) = key
    end do
end subroutine insertion_sort

program main
    implicit none
    integer :: data(5) = [12, 11, 13, 5, 6]
    call insertion_sort(data, 5)
    print *, data
end program main
