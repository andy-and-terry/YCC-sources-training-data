module geometry
    implicit none
contains
    pure function hypotenuse(a, b) result(c)
        real, intent(in) :: a, b
        real :: c
        c = sqrt(a * a + b * b)
    end function hypotenuse

    pure function dot(u, v) result(d)
        real, intent(in) :: u(:), v(:)
        real :: d
        d = sum(u * v)
    end function dot

    pure subroutine polar(x, y, r, theta)
        real, intent(in) :: x, y
        real, intent(out) :: r, theta
        r = hypotenuse(x, y)
        theta = atan2(y, x)
    end subroutine polar
end module geometry

program pure_function_demo
    use geometry
    implicit none
    real :: r, theta

    print '(A, F6.2)', 'hypotenuse(3,4) = ', hypotenuse(3.0, 4.0)
    print '(A, F6.2)', 'dot = ', dot([1.0, 2.0, 3.0], [4.0, 5.0, 6.0])
    call polar(1.0, 1.0, r, theta)
    print '(A, F6.3, A, F6.3)', 'r = ', r, ' theta = ', theta
end program pure_function_demo
