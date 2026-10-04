program recursive_function_demo
    implicit none

    print *, 'ackermann(2,3) =', ackermann(2, 3)
    print *, 'digit sum 98765 =', digit_sum(98765)
    print *, 'power(3,5) =', power(3, 5)
    print *, 'gcd(84,36) =', gcd(84, 36)

contains

    recursive function ackermann(m, n) result(res)
        integer, intent(in) :: m, n
        integer :: res
        if (m == 0) then
            res = n + 1
        else if (n == 0) then
            res = ackermann(m - 1, 1)
        else
            res = ackermann(m - 1, ackermann(m, n - 1))
        end if
    end function ackermann

    recursive function digit_sum(n) result(s)
        integer, intent(in) :: n
        integer :: s
        if (n < 10) then
            s = n
        else
            s = mod(n, 10) + digit_sum(n / 10)
        end if
    end function digit_sum

    recursive function power(base, exp) result(p)
        integer, intent(in) :: base, exp
        integer :: p
        if (exp == 0) then
            p = 1
        else if (mod(exp, 2) == 0) then
            p = power(base, exp / 2)**2
        else
            p = base * power(base, exp - 1)
        end if
    end function power

    recursive function gcd(a, b) result(g)
        integer, intent(in) :: a, b
        integer :: g
        if (b == 0) then
            g = a
        else
            g = gcd(b, mod(a, b))
        end if
    end function gcd

end program recursive_function_demo
