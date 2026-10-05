module math_utils
    implicit none
contains

    pure function hypotenuse(a, b) result(h)
        real, intent(in) :: a, b
        real :: h
        h = sqrt(a * a + b * b)
    end function hypotenuse

    pure function clamp(x, lo, hi) result(r)
        integer, intent(in) :: x, lo, hi
        integer :: r
        r = max(lo, min(hi, x))
    end function clamp

    pure function mean(values) result(m)
        real, intent(in) :: values(:)
        real :: m
        m = sum(values) / real(size(values))
    end function mean

end module math_utils

program pure_function_demo
    use math_utils
    implicit none

    print *, hypotenuse(3.0, 4.0)
    print *, clamp(15, 0, 10), clamp(-3, 0, 10), clamp(5, 0, 10)
    print *, mean([1.0, 2.0, 3.0, 4.0])
end program pure_function_demo
