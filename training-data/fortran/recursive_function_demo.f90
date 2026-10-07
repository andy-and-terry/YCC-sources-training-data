module recursion_mod
    implicit none
contains
    recursive function factorial(n) result(r)
        integer, intent(in) :: n
        integer :: r
        if (n <= 1) then
            r = 1
        else
            r = n * factorial(n - 1)
        end if
    end function factorial

    recursive function ackermann(m, n) result(r)
        integer, intent(in) :: m, n
        integer :: r
        if (m == 0) then
            r = n + 1
        else if (n == 0) then
            r = ackermann(m - 1, 1)
        else
            r = ackermann(m - 1, ackermann(m, n - 1))
        end if
    end function ackermann
end module recursion_mod

program recursive_function_demo
    use recursion_mod
    implicit none
    print *, "5! =", factorial(5)
    print *, "ackermann(2,3) =", ackermann(2, 3)
end program recursive_function_demo
