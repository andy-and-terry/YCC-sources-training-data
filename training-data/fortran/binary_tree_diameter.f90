module binary_tree_diameter_mod
    implicit none
    type :: tree_node
        integer :: value
        type(tree_node), pointer :: left => null()
        type(tree_node), pointer :: right => null()
    end type tree_node
    integer :: max_diameter
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

    recursive integer function height(node) result(h)
        type(tree_node), pointer, intent(in) :: node
        integer :: left_h, right_h
        if (.not. associated(node)) then
            h = 0
            return
        end if
        left_h = height(node%left)
        right_h = height(node%right)
        max_diameter = max(max_diameter, left_h + right_h)
        h = max(left_h, right_h) + 1
    end function height

    integer function diameter(root)
        type(tree_node), pointer, intent(in) :: root
        integer :: h
        max_diameter = 0
        h = height(root)
        diameter = max_diameter
    end function diameter
end module binary_tree_diameter_mod

program main
    use binary_tree_diameter_mod
    implicit none
    type(tree_node), pointer :: root => null()

    call insert(root, 4)
    call insert(root, 2)
    call insert(root, 6)
    call insert(root, 1)
    call insert(root, 3)
    print *, diameter(root)
end program main
