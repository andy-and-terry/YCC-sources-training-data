module doubly_linked_list_mod
    implicit none
    type :: dnode
        integer :: value
        type(dnode), pointer :: prev => null()
        type(dnode), pointer :: next => null()
    end type dnode
contains
    subroutine push_back(head, tail, value)
        type(dnode), pointer, intent(inout) :: head, tail
        integer, intent(in) :: value
        type(dnode), pointer :: new_node
        allocate(new_node)
        new_node%value = value
        new_node%next => null()
        new_node%prev => tail
        if (associated(tail)) then
            tail%next => new_node
        else
            head => new_node
        end if
        tail => new_node
    end subroutine push_back

    subroutine print_forward(head)
        type(dnode), pointer, intent(in) :: head
        type(dnode), pointer :: cur
        cur => head
        do while (associated(cur))
            print *, cur%value
            cur => cur%next
        end do
    end subroutine print_forward

    subroutine print_backward(tail)
        type(dnode), pointer, intent(in) :: tail
        type(dnode), pointer :: cur
        cur => tail
        do while (associated(cur))
            print *, cur%value
            cur => cur%prev
        end do
    end subroutine print_backward
end module doubly_linked_list_mod

program main
    use doubly_linked_list_mod
    implicit none
    type(dnode), pointer :: head => null()
    type(dnode), pointer :: tail => null()

    call push_back(head, tail, 1)
    call push_back(head, tail, 2)
    call push_back(head, tail, 3)
    call print_forward(head)
    call print_backward(tail)
end program main
