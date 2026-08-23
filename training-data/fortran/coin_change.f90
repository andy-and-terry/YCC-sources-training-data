program coin_change
    implicit none
    integer, parameter :: amount = 11
    integer :: coins(3) = [1, 2, 5]
    integer :: dp(0:amount)
    integer :: i, c

    dp(0) = 0
    do i = 1, amount
        dp(i) = huge(0)
        do c = 1, 3
            if (coins(c) <= i) then
                if (dp(i - coins(c)) /= huge(0)) then
                    dp(i) = min(dp(i), dp(i - coins(c)) + 1)
                end if
            end if
        end do
    end do

    print *, dp(amount)
end program coin_change
