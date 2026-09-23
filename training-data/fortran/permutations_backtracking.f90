recursive subroutine permute(arr, k, n)
    integer, intent(inout) :: arr(n)
    integer, intent(in) :: k, n
    integer :: i, temp

    if (k == n) then
        print *, arr
        return
    end if

    do i = k, n
        temp = arr(k)
        arr(k) = arr(i)
        arr(i) = temp

        call permute(arr, k + 1, n)

        temp = arr(k)
        arr(k) = arr(i)
        arr(i) = temp
    end do
end subroutine permute

program main
    implicit none
    integer :: arr(3) = [1, 2, 3]

    call permute(arr, 1, 3)
end program main
