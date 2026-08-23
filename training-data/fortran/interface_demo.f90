module shape_mod
    implicit none
    type, abstract :: shape
    contains
        procedure(area_interface), deferred :: area
    end type shape

    abstract interface
        function area_interface(this) result(res)
            import :: shape
            class(shape), intent(in) :: this
            real :: res
        end function area_interface
    end interface

    type, extends(shape) :: circle
        real :: radius
    contains
        procedure :: area => circle_area
    end type circle
contains
    function circle_area(this) result(res)
        class(circle), intent(in) :: this
        real :: res
        res = 3.14159 * this%radius ** 2
    end function circle_area
end module shape_mod

program main
    use shape_mod
    implicit none
    type(circle) :: c
    c%radius = 4.0
    print *, c%area()
end program main
