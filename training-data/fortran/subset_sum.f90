program subset_sum
    implicit none
    integer, parameter :: n = 5, goal_sum = 9
    integer :: nums(n) = [3, 34, 4, 12, 5]
    logical :: dp(0:goal_sum)
    integer :: i, s

    dp = .false.
    dp(0) = .true.

    do i = 1, n
        do s = goal_sum, nums(i), -1
            if (dp(s - nums(i))) dp(s) = .true.
        end do
    end do

    print *, dp(goal_sum)
end program subset_sum
