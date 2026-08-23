module generic_stack_mod
    implicit none
    type :: int_stack
        integer, allocatable :: items(:)
        integer :: top = 0
    contains
        procedure :: push => stack_push
        procedure :: pop => stack_pop
    end type int_stack
contains
    subroutine stack_push(this, value)
        class(int_stack), intent(inout) :: this
        integer, intent(in) :: value
        if (.not. allocated(this%items)) allocate(this%items(10))
        this%top = this%top + 1
        this%items(this%top) = value
    end subroutine stack_push

    function stack_pop(this) result(value)
        class(int_stack), intent(inout) :: this
        integer :: value
        value = this%items(this%top)
        this%top = this%top - 1
    end function stack_pop
end module generic_stack_mod

program main
    use generic_stack_mod
    implicit none
    type(int_stack) :: s
    call s%push(1)
    call s%push(2)
    call s%push(3)
    print *, s%pop()
    print *, s%pop()
end program main
