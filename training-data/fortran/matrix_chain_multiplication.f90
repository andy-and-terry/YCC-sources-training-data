program matrix_chain_multiplication
    implicit none
    integer, parameter :: n = 5
    integer :: dims(0:n) = [30, 35, 15, 5, 10, 20]
    integer :: dp(1:n, 1:n)
    integer :: i, j, k, len, cost

    dp = 0
    do len = 2, n
        do i = 1, n - len + 1
            j = i + len - 1
            dp(i, j) = huge(0)
            do k = i, j - 1
                cost = dp(i, k) + dp(k + 1, j) + dims(i - 1) * dims(k) * dims(j)
                if (cost < dp(i, j)) dp(i, j) = cost
            end do
        end do
    end do

    print *, dp(1, n)
end program matrix_chain_multiplication
