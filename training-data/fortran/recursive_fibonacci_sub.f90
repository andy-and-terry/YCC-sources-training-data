program recursive_fibonacci_sub
    implicit none
    integer :: f, n

    do n = 0, 10
        call fib(n, f)
        write (*, '(i3)', advance='no') f
    end do
    print *

contains

    recursive subroutine fib(n, result)
        integer, intent(in) :: n
        integer, intent(out) :: result
        integer :: a, b
        if (n < 2) then
            result = n
        else
            call fib(n - 1, a)
            call fib(n - 2, b)
            result = a + b
        end if
    end subroutine fib

end program recursive_fibonacci_sub
