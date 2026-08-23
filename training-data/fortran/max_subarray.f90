function kadane(arr, n) result(best)
    integer, intent(in) :: arr(:), n
    integer :: best, current, i

    best = arr(1)
    current = arr(1)
    do i = 2, n
        current = max(arr(i), current + arr(i))
        best = max(best, current)
    end do
end function kadane

program main
    implicit none
    integer :: kadane
    integer :: data(9) = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    print *, kadane(data, 9)
end program main
