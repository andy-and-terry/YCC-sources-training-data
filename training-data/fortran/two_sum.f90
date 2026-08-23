program two_sum
    implicit none
    integer, parameter :: n = 4
    integer :: arr(n) = [2, 7, 11, 15]
    integer :: target = 9
    integer :: i, j

    do i = 1, n - 1
        do j = i + 1, n
            if (arr(i) + arr(j) == target) then
                print *, i, j
                stop
            end if
        end do
    end do
end program two_sum
