module shapes
    implicit none

    type :: shape
        character(len=10) :: name = "shape"
    contains
        procedure :: area => shape_area
    end type shape

    type, extends(shape) :: square
        real :: side = 1.0
    contains
        procedure :: area => square_area
    end type square

    type, extends(shape) :: circle
        real :: radius = 1.0
    contains
        procedure :: area => circle_area
    end type circle

contains

    real function shape_area(self)
        class(shape), intent(in) :: self
        shape_area = 0.0
    end function shape_area

    real function square_area(self)
        class(square), intent(in) :: self
        square_area = self%side ** 2
    end function square_area

    real function circle_area(self)
        class(circle), intent(in) :: self
        circle_area = 3.14159265 * self%radius ** 2
    end function circle_area

end module shapes

program polymorphism_demo
    use shapes
    implicit none

    type :: holder
        class(shape), allocatable :: item
    end type holder

    type(holder) :: list(2)
    integer :: i

    allocate(square :: list(1)%item)
    allocate(circle :: list(2)%item)

    select type (p => list(1)%item)
    type is (square)
        p%side = 3.0
        p%name = "square"
    end select

    select type (p => list(2)%item)
    type is (circle)
        p%radius = 2.0
        p%name = "circle"
    end select

    do i = 1, 2
        print '(A, F8.3)', list(i)%item%name, list(i)%item%area()
    end do
end program polymorphism_demo
