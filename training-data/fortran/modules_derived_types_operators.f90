module vec_mod
    implicit none
    type :: vec2
        real :: x = 0.0, y = 0.0
    end type vec2
    interface operator(+)
        module procedure add_vec
    end interface
    interface operator(*)
        module procedure scale_vec
    end interface
contains
    pure function add_vec(a, b) result(c)
        type(vec2), intent(in) :: a, b
        type(vec2) :: c
        c = vec2(a%x + b%x, a%y + b%y)
    end function add_vec
    pure function scale_vec(k, a) result(c)
        real, intent(in) :: k
        type(vec2), intent(in) :: a
        type(vec2) :: c
        c = vec2(k * a%x, k * a%y)
    end function scale_vec
end module vec_mod

program modules_derived_types_operators
    use vec_mod
    implicit none
    type(vec2) :: a, b
    a = vec2(1.0, 2.0)
    b = a + 2.0 * a
    print '(2f6.1)', b%x, b%y
end program modules_derived_types_operators
