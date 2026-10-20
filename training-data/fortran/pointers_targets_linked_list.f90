program pointers_targets_linked_list
    implicit none
    type :: node
        integer :: val
        type(node), pointer :: next => null()
    end type node
    type(node), pointer :: head, p, tmp
    integer :: i
    integer, target :: x = 10
    integer, pointer :: px
    head => null()
    do i = 1, 5
        allocate (tmp)
        tmp%val = i * i
        tmp%next => head
        head => tmp
    end do
    p => head
    do while (associated(p))
        write (*, '(i4)', advance='no') p%val
        p => p%next
    end do
    print *
    px => x
    px = px + 5
    print *, x, associated(px), associated(head)
    do while (associated(head))
        tmp => head%next
        deallocate (head)
        head => tmp
    end do
    print *, associated(head)
end program pointers_targets_linked_list
