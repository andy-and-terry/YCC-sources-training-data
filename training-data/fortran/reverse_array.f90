subroutine reverse_array(arr, n)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: n
    integer :: i, tmp

    do i = 1, n / 2
        tmp = arr(i)
        arr(i) = arr(n - i + 1)
        arr(n - i + 1) = tmp
    end do
end subroutine reverse_array

program main
    implicit none
    integer :: data(5) = [1, 2, 3, 4, 5]
    call reverse_array(data, 5)
    print *, data
end program main
