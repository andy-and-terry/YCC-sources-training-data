program associate_construct_demo
    implicit none
    type :: point
        real :: x, y
    end type point

    type(point) :: p
    p%x = 3.0
    p%y = 4.0

    associate (px => p%x, py => p%y, dist => sqrt(p%x**2 + p%y**2))
        print *, 'x =', px
        print *, 'y =', py
        print *, 'distance =', dist
    end associate
end program associate_construct_demo
