program knapsack_01
    implicit none
    integer, parameter :: n = 4, capacity = 5
    integer :: weights(n) = [2, 3, 4, 5]
    integer :: values(n) = [3, 4, 5, 6]
    integer :: dp(0:capacity)
    integer :: i, cap

    dp = 0
    do i = 1, n
        do cap = capacity, weights(i), -1
            dp(cap) = max(dp(cap), dp(cap - weights(i)) + values(i))
        end do
    end do

    print *, dp(capacity)
end program knapsack_01
