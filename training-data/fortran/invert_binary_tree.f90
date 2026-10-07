module invert_binary_tree_mod
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
        else
            call insert(node%right, value)
        end if
    end subroutine insert

    recursive subroutine invert(node)
        type(tree_node), pointer, intent(inout) :: node
        type(tree_node), pointer :: temp
        if (.not. associated(node)) return
        call invert(node%left)
        call invert(node%right)
        temp => node%left
        node%left => node%right
        node%right => temp
    end subroutine invert

    recursive subroutine inorder(node)
        type(tree_node), pointer, intent(in) :: node
        if (.not. associated(node)) return
        call inorder(node%left)
        print *, node%value
        call inorder(node%right)
    end subroutine inorder
end module invert_binary_tree_mod

program main
    use invert_binary_tree_mod
    implicit none
    type(tree_node), pointer :: root => null()

    call insert(root, 4)
    call insert(root, 2)
    call insert(root, 7)
    call insert(root, 1)
    call insert(root, 3)
    call invert(root)
    call inorder(root)
end program main
