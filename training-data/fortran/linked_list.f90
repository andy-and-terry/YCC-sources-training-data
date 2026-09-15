module linked_list_mod
    implicit none
    type :: node
        integer :: value
        type(node), pointer :: next => null()
    end type node
contains
    subroutine push_front(head, value)
        type(node), pointer, intent(inout) :: head
        integer, intent(in) :: value
        type(node), pointer :: new_node
        allocate(new_node)
        new_node%value = value
        new_node%next => head
        head => new_node
    end subroutine push_front

    subroutine print_list(head)
        type(node), pointer, intent(in) :: head
        type(node), pointer :: cur
        cur => head
        do while (associated(cur))
            print *, cur%value
            cur => cur%next
        end do
    end subroutine print_list

    function sum_list(head) result(total)
        type(node), pointer, intent(in) :: head
        integer :: total
        type(node), pointer :: cur
        total = 0
        cur => head
        do while (associated(cur))
            total = total + cur%value
            cur => cur%next
        end do
    end function sum_list
end module linked_list_mod

program main
    use linked_list_mod
    implicit none
    type(node), pointer :: head => null()
    call push_front(head, 3)
    call push_front(head, 2)
    call push_front(head, 1)
    call print_list(head)
    print *, sum_list(head)
end program main
