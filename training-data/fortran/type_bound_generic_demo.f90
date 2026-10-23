module vector_mod
    implicit none

    type :: vec2
        real :: x = 0.0, y = 0.0
    contains
        procedure :: add_vec
        procedure :: scale_by
        procedure :: show
        generic :: combine => add_vec, scale_by
    end type vec2

contains

    function add_vec(self, other) result(r)
        class(vec2), intent(in) :: self
        type(vec2), intent(in) :: other
        type(vec2) :: r
        r = vec2(self%x + other%x, self%y + other%y)
    end function add_vec

    function scale_by(self, k) result(r)
        class(vec2), intent(in) :: self
        real, intent(in) :: k
        type(vec2) :: r
        r = vec2(self%x * k, self%y * k)
    end function scale_by

    subroutine show(self)
        class(vec2), intent(in) :: self
        print '(A,F5.1,A,F5.1,A)', '(', self%x, ',', self%y, ')'
    end subroutine show

end module vector_mod

program type_bound_generic_demo
    use vector_mod
    implicit none
    type(vec2) :: a, b, c

    a = vec2(1.0, 2.0)
    b = vec2(3.0, 4.0)

    ! One generic name, dispatched on the argument type
    c = a%combine(b)
    call c%show()
    c = a%combine(2.5)
    call c%show()
end program type_bound_generic_demo
