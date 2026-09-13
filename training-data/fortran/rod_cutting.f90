program rod_cutting
    implicit none
    integer, parameter :: n = 8
    integer :: prices(n) = [1, 5, 8, 9, 10, 17, 17, 20]
    integer :: dp(0:n)
    integer :: i, j

    dp(0) = 0
    do i = 1, n
        dp(i) = 0
        do j = 1, i
            dp(i) = max(dp(i), prices(j) + dp(i - j))
        end do
    end do

    print *, dp(n)
end program rod_cutting
