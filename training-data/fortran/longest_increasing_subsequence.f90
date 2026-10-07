program longest_increasing_subsequence
    implicit none
    integer, parameter :: n = 8
    integer :: arr(n) = [10, 9, 2, 5, 3, 7, 101, 18]
    integer :: dp(n)
    integer :: i, j

    dp = 1
    do i = 2, n
        do j = 1, i - 1
            if (arr(j) < arr(i) .and. dp(j) + 1 > dp(i)) then
                dp(i) = dp(j) + 1
            end if
        end do
    end do

    print *, maxval(dp)
end program longest_increasing_subsequence
