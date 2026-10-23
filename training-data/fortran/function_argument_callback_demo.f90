module integrate_mod
    implicit none
    abstract interface
        function fn(x) result(y)
            real, intent(in) :: x
            real :: y
        end function fn
    end interface
contains
    ! Midpoint rule; f is a procedure dummy argument.
    function midpoint(f, a, b, n) result(total)
        procedure(fn) :: f
        real, intent(in) :: a, b
        integer, intent(in) :: n
        real :: total, h
        integer :: i
        h = (b - a) / n
        total = 0.0
        do i = 1, n
            total = total + f(a + (i - 0.5) * h)
        end do
        total = total * h
    end function midpoint

    function square(x) result(y)
        real, intent(in) :: x
        real :: y
        y = x * x
    end function square
end module integrate_mod

program function_argument_callback_demo
    use integrate_mod
    implicit none
    print '(a, f8.4)', 'int x^2 0..3 = ', midpoint(square, 0.0, 3.0, 1000)
    print '(a, f8.4)', 'int sin 0..pi = ', midpoint(sin, 0.0, 3.14159265, 1000)
end program function_argument_callback_demo
