module min_stack_mod
    implicit none
    integer, parameter :: max_depth = 32
    integer :: stack_arr(max_depth)
    integer :: min_arr(max_depth)
    integer :: sp = 0
    integer :: msp = 0
contains
    subroutine ms_push(value)
        integer, intent(in) :: value
        sp = sp + 1
        stack_arr(sp) = value
        if (msp == 0) then
            msp = msp + 1
            min_arr(msp) = value
        else if (value <= min_arr(msp)) then
            msp = msp + 1
            min_arr(msp) = value
        end if
    end subroutine ms_push

    subroutine ms_pop()
        if (stack_arr(sp) == min_arr(msp)) msp = msp - 1
        sp = sp - 1
    end subroutine ms_pop

    integer function ms_min()
        ms_min = min_arr(msp)
    end function ms_min
end module min_stack_mod

program main
    use min_stack_mod
    implicit none
    call ms_push(5)
    call ms_push(2)
    call ms_push(7)
    print *, ms_min()
    call ms_pop()
    print *, ms_min()
end program main
