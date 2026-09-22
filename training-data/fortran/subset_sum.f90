program subset_sum
    implicit none
    integer, parameter :: n = 6, target = 9
    integer :: values(n) = [3, 34, 4, 12, 5, 2]
    logical :: dp(0:target)
    integer :: i, s

    dp = .false.
    dp(0) = .true.
    do i = 1, n
        do s = target, values(i), -1
            if (dp(s - values(i))) dp(s) = .true.
        end do
    end do

    print *, dp(target)
end program subset_sum
