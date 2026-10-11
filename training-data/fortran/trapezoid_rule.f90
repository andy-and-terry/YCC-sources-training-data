program trapezoid_rule
    implicit none
    real(8), parameter :: pi = 3.14159265358979d0

    print '(f10.6)', integrate(f_square, 0.0d0, 3.0d0, 1000)
    print '(f10.6)', integrate(dsin, 0.0d0, pi, 1000)

contains

    real(8) function f_square(x)
        real(8), intent(in) :: x
        f_square = x * x
    end function f_square

    real(8) function integrate(f, a, b, n)
        interface
            real(8) function f(x)
                real(8), intent(in) :: x
            end function f
        end interface
        real(8), intent(in) :: a, b
        integer, intent(in) :: n
        real(8) :: h
        integer :: i
        h = (b - a) / n
        integrate = 0.5d0 * (f(a) + f(b))
        do i = 1, n - 1
            integrate = integrate + f(a + i * h)
        end do
        integrate = integrate * h
    end function integrate

end program trapezoid_rule
