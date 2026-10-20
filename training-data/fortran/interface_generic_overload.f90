module generic_mod
    implicit none
    interface swap
        module procedure swap_int, swap_real, swap_str
    end interface
contains
    subroutine swap_int(a, b)
        integer, intent(inout) :: a, b
        integer :: t
        t = a; a = b; b = t
    end subroutine swap_int
    subroutine swap_real(a, b)
        real, intent(inout) :: a, b
        real :: t
        t = a; a = b; b = t
    end subroutine swap_real
    subroutine swap_str(a, b)
        character(len=*), intent(inout) :: a, b
        character(len=len(a)) :: t
        t = a; a = b; b = t
    end subroutine swap_str
end module generic_mod

program interface_generic_overload
    use generic_mod
    implicit none
    integer :: i = 1, j = 2
    real :: x = 1.5, y = 2.5
    character(len=3) :: s = "abc", t = "xyz"
    call swap(i, j)
    call swap(x, y)
    call swap(s, t)
    print *, i, j, x, y, s, t
end program interface_generic_overload
