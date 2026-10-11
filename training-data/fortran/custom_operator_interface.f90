module vec_ops
    implicit none
    type :: vec2
        real :: x, y
    end type vec2
    interface operator(.dot.)
        module procedure dot2
    end interface
    interface operator(+)
        module procedure add2
    end interface
contains
    real function dot2(a, b)
        type(vec2), intent(in) :: a, b
        dot2 = a%x * b%x + a%y * b%y
    end function dot2
    type(vec2) function add2(a, b)
        type(vec2), intent(in) :: a, b
        add2 = vec2(a%x + b%x, a%y + b%y)
    end function add2
end module vec_ops

program custom_operator_interface
    use vec_ops
    implicit none
    type(vec2) :: a, b, c

    a = vec2(1.0, 2.0)
    b = vec2(3.0, 4.0)
    c = a + b
    print *, c%x, c%y
    print *, a .dot. b
end program custom_operator_interface
