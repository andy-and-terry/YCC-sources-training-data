module math_utils
    implicit none
contains

    pure function clamp(x, lo, hi) result(r)
        real, intent(in) :: x, lo, hi
        real :: r
        r = max(lo, min(hi, x))
    end function clamp

    pure integer function digit_count(n)
        integer, intent(in) :: n
        integer :: m
        m = abs(n)
        digit_count = 1
        do while (m >= 10)
            m = m / 10
            digit_count = digit_count + 1
        end do
    end function digit_count

    pure recursive function power(base, exp) result(r)
        integer, intent(in) :: base, exp
        integer :: r
        if (exp == 0) then
            r = 1
        else
            r = base * power(base, exp - 1)
        end if
    end function power
end module math_utils

program pure_function_demo
    use math_utils
    implicit none
    print *, clamp(7.5, 0.0, 5.0), clamp(-1.0, 0.0, 5.0)
    print *, digit_count(0), digit_count(12345), digit_count(-987)
    print *, power(2, 10)
end program pure_function_demo
