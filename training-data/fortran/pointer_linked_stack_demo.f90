program pointer_linked_stack_demo
    implicit none

    type :: node
        integer :: value
        type(node), pointer :: next => null()
    end type node

    type(node), pointer :: top => null()
    integer :: v

    call push(top, 10)
    call push(top, 20)
    call push(top, 30)
    call print_stack(top)

    do while (associated(top))
        call pop(top, v)
        print *, 'popped', v
    end do

contains

    subroutine push(head, value)
        type(node), pointer, intent(inout) :: head
        integer, intent(in) :: value
        type(node), pointer :: fresh
        allocate(fresh)
        fresh%value = value
        fresh%next => head
        head => fresh
    end subroutine push

    subroutine pop(head, value)
        type(node), pointer, intent(inout) :: head
        integer, intent(out) :: value
        type(node), pointer :: old
        old => head
        value = old%value
        head => old%next
        deallocate(old)
    end subroutine pop

    subroutine print_stack(head)
        type(node), pointer, intent(in) :: head
        type(node), pointer :: cur
        cur => head
        do while (associated(cur))
            write (*, '(I0, 1X)', advance='no') cur%value
            cur => cur%next
        end do
        print *
    end subroutine print_stack
end program pointer_linked_stack_demo
