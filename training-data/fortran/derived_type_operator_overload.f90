module vector_mod
    implicit none
    type :: vector2
        real :: x, y
    end type vector2

    interface operator(+)
        module procedure add_vectors
    end interface operator(+)
contains
    function add_vectors(a, b) result(res)
        type(vector2), intent(in) :: a, b
        type(vector2) :: res
        res%x = a%x + b%x
        res%y = a%y + b%y
    end function add_vectors
end module vector_mod

program main
    use vector_mod
    implicit none
    type(vector2) :: v1, v2, v3
    v1 = vector2(1.0, 2.0)
    v2 = vector2(3.0, 4.0)
    v3 = v1 + v2
    print *, v3%x, v3%y
end program main
