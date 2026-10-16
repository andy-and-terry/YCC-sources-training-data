module temp_mod
    implicit none
    type :: celsius
        real :: deg
    end type celsius
    interface assignment(=)
        module procedure from_real, to_real
    end interface
contains
    subroutine from_real(c, r)
        type(celsius), intent(out) :: c
        real, intent(in) :: r
        c%deg = r
    end subroutine from_real
    subroutine to_real(r, c)
        real, intent(out) :: r
        type(celsius), intent(in) :: c
        r = c%deg * 9.0 / 5.0 + 32.0
    end subroutine to_real
end module temp_mod

program user_defined_assignment
    use temp_mod
    implicit none
    type(celsius) :: t
    real :: f

    t = 100.0
    f = t
    print *, t%deg, 'C =', f, 'F'
end program user_defined_assignment
