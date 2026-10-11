program internal_procedures_demo
    implicit none
    integer :: factor

    factor = 3
    print *, scaled(5)
    factor = 10
    print *, scaled(5)
    call swap_print(1, 2)

contains

    integer function scaled(x)
        integer, intent(in) :: x
        scaled = x * factor     ! host association
    end function scaled

    subroutine swap_print(a, b)
        integer, intent(in) :: a, b
        print *, b, a
    end subroutine swap_print

end program internal_procedures_demo
