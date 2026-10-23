program simpson_rule
    implicit none
    integer, parameter :: dp = kind(1.0d0)

    ! Integral of exp(-x^2) from 0 to 1 is about 0.7468241328
    print '(a, f12.8)', 'simpson n=4:   ', simpson(0.0_dp, 1.0_dp, 4)
    print '(a, f12.8)', 'simpson n=100: ', simpson(0.0_dp, 1.0_dp, 100)

contains

    pure function f(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = exp(-x * x)
    end function f

    function simpson(a, b, n) result(s)
        real(dp), intent(in) :: a, b
        integer, intent(in) :: n    ! must be even
        real(dp) :: s, h
        integer :: i
        h = (b - a) / n
        s = f(a) + f(b)
        do i = 1, n - 1
            if (mod(i, 2) == 1) then
                s = s + 4.0_dp * f(a + i * h)
            else
                s = s + 2.0_dp * f(a + i * h)
            end if
        end do
        s = s * h / 3.0_dp
    end function simpson

end program simpson_rule
