module geometry
    implicit none
contains
    pure function triangle_area(base, height) result(area)
        real, intent(in) :: base, height
        real :: area
        area = 0.5 * base * height
    end function triangle_area

    pure integer function clamp(x, lo, hi)
        integer, intent(in) :: x, lo, hi
        clamp = max(lo, min(hi, x))
    end function clamp
end module geometry

program pure_function_demo
    use geometry
    implicit none
    print '(F6.2)', triangle_area(3.0, 4.0)
    print '(I0)', clamp(15, 0, 10)
    print '(I0)', clamp(-3, 0, 10)
end program pure_function_demo
