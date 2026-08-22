program derived_type_demo
    implicit none

    type :: point
        real :: x
        real :: y
    end type point

    type(point) :: p1, p2, p3

    p1 = point(1.0, 2.0)
    p2 = point(3.0, 4.0)
    p3 = point(p1%x + p2%x, p1%y + p2%y)
    print *, p3%x, p3%y
end program derived_type_demo
