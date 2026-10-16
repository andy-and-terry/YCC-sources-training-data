program function_result_clause
    implicit none
    print *, factorial(6)
    print *, power_sum(3, 4)

contains

    recursive function factorial(n) result(res)
        integer, intent(in) :: n
        integer :: res
        if (n <= 1) then
            res = 1
        else
            res = n * factorial(n - 1)
        end if
    end function factorial

    function power_sum(base, count) result(total)
        integer, intent(in) :: base, count
        integer :: total, k
        total = 0
        do k = 1, count
            total = total + base**k
        end do
    end function power_sum

end program function_result_clause
