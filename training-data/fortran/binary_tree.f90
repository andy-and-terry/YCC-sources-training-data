module binary_tree_mod
    implicit none
    type :: tree_node
        integer :: value
        type(tree_node), pointer :: left => null()
        type(tree_node), pointer :: right => null()
    end type tree_node
contains
    recursive subroutine insert(node, value)
        type(tree_node), pointer, intent(inout) :: node
        integer, intent(in) :: value
        if (.not. associated(node)) then
            allocate(node)
            node%value = value
            return
        end if
        if (value < node%value) then
            call insert(node%left, value)
        else if (value > node%value) then
            call insert(node%right, value)
        end if
    end subroutine insert

    recursive subroutine inorder(node)
        type(tree_node), pointer, intent(in) :: node
        if (.not. associated(node)) return
        call inorder(node%left)
        print *, node%value
        call inorder(node%right)
    end subroutine inorder
end module binary_tree_mod

program main
    use binary_tree_mod
    implicit none
    type(tree_node), pointer :: root => null()
    call insert(root, 5)
    call insert(root, 3)
    call insert(root, 8)
    call insert(root, 1)
    call inorder(root)
end program main
