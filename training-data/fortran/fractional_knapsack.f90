program fractional_knapsack
    implicit none
    integer, parameter :: n = 4
    real :: weights(n) = [10.0, 20.0, 30.0, 15.0]
    real :: values(n)  = [60.0, 100.0, 120.0, 75.0]
    real :: ratio(n)
    integer :: order(n)
    real :: capacity, total_value, remaining
    integer :: i, j, idx, temp_i

    capacity = 50.0
    ratio = values / weights
    order = [(i, i = 1, n)]

    do i = 1, n - 1
        do j = 1, n - i
            if (ratio(order(j)) < ratio(order(j + 1))) then
                temp_i = order(j)
                order(j) = order(j + 1)
                order(j + 1) = temp_i
            end if
        end do
    end do

    remaining = capacity
    total_value = 0.0
    do i = 1, n
        idx = order(i)
        if (remaining <= 0.0) exit
        if (weights(idx) <= remaining) then
            total_value = total_value + values(idx)
            remaining = remaining - weights(idx)
        else
            total_value = total_value + values(idx) * (remaining / weights(idx))
            remaining = 0.0
        end if
    end do

    print *, total_value
end program fractional_knapsack
