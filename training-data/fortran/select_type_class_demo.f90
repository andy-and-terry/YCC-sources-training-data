module shapes_mod
    implicit none

    type, abstract :: shape
    contains
        procedure(area_iface), deferred :: area
    end type shape

    abstract interface
        function area_iface(self) result(a)
            import :: shape
            class(shape), intent(in) :: self
            real :: a
        end function area_iface
    end interface

    type, extends(shape) :: circle
        real :: r
    contains
        procedure :: area => circle_area
    end type circle

    type, extends(shape) :: square
        real :: s
    contains
        procedure :: area => square_area
    end type square

contains

    function circle_area(self) result(a)
        class(circle), intent(in) :: self
        real :: a
        a = 3.14159 * self%r**2
    end function circle_area

    function square_area(self) result(a)
        class(square), intent(in) :: self
        real :: a
        a = self%s**2
    end function square_area
end module shapes_mod

program select_type_class_demo
    use shapes_mod
    implicit none
    class(shape), allocatable :: s

    allocate(s, source=circle(2.0))
    call describe(s)
    deallocate(s)
    allocate(s, source=square(3.0))
    call describe(s)

contains

    subroutine describe(item)
        class(shape), intent(in) :: item
        select type (item)
        type is (circle)
            print *, 'circle radius', item%r, 'area', item%area()
        type is (square)
            print *, 'square side', item%s, 'area', item%area()
        end select
    end subroutine describe
end program select_type_class_demo
