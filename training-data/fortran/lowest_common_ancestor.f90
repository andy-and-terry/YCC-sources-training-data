module lowest_common_ancestor_mod
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

    recursive function lca(node, p, q) result(res)
        type(tree_node), pointer, intent(in) :: node
        integer, intent(in) :: p, q
        type(tree_node), pointer :: res
        if (.not. associated(node)) then
            res => null()
            return
        end if
        if (p < node%value .and. q < node%value) then
            res => lca(node%left, p, q)
        else if (p > node%value .and. q > node%value) then
            res => lca(node%right, p, q)
        else
            res => node
        end if
    end function lca
end module lowest_common_ancestor_mod

program main
    use lowest_common_ancestor_mod
    implicit none
    type(tree_node), pointer :: root => null()
    type(tree_node), pointer :: result

    call insert(root, 6)
    call insert(root, 2)
    call insert(root, 8)
    call insert(root, 0)
    call insert(root, 4)
    result => lca(root, 0, 4)
    print *, result%value
end program main
