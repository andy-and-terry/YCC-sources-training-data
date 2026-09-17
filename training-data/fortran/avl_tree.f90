module avl_tree_mod
    implicit none
    type :: avl_node
        integer :: value
        integer :: height
        type(avl_node), pointer :: left => null()
        type(avl_node), pointer :: right => null()
    end type avl_node
contains
    integer function node_height(node) result(h)
        type(avl_node), pointer, intent(in) :: node
        if (associated(node)) then
            h = node%height
        else
            h = 0
        end if
    end function node_height

    integer function balance_factor(node) result(bf)
        type(avl_node), pointer, intent(in) :: node
        if (associated(node)) then
            bf = node_height(node%left) - node_height(node%right)
        else
            bf = 0
        end if
    end function balance_factor

    function make_node(value, left, right) result(node)
        integer, intent(in) :: value
        type(avl_node), pointer, intent(in) :: left, right
        type(avl_node), pointer :: node
        allocate(node)
        node%value = value
        node%left => left
        node%right => right
        node%height = 1 + max(node_height(left), node_height(right))
    end function make_node

    function rotate_left(node) result(new_root)
        type(avl_node), pointer, intent(in) :: node
        type(avl_node), pointer :: new_root, r
        r => node%right
        new_root => make_node(r%value, make_node(node%value, node%left, r%left), r%right)
    end function rotate_left

    function rotate_right(node) result(new_root)
        type(avl_node), pointer, intent(in) :: node
        type(avl_node), pointer :: new_root, l
        l => node%left
        new_root => make_node(l%value, l%left, make_node(node%value, l%right, node%right))
    end function rotate_right

    recursive function insert(node, value) result(new_node)
        type(avl_node), pointer, intent(in) :: node
        integer, intent(in) :: value
        type(avl_node), pointer :: new_node
        integer :: bf

        if (.not. associated(node)) then
            new_node => make_node(value, null(), null())
            return
        end if

        if (value < node%value) then
            new_node => make_node(node%value, insert(node%left, value), node%right)
        else if (value > node%value) then
            new_node => make_node(node%value, node%left, insert(node%right, value))
        else
            new_node => node
            return
        end if

        bf = balance_factor(new_node)
        if (bf > 1) then
            if (balance_factor(new_node%left) < 0) then
                new_node%left => rotate_left(new_node%left)
            end if
            new_node => rotate_right(new_node)
        else if (bf < -1) then
            if (balance_factor(new_node%right) > 0) then
                new_node%right => rotate_right(new_node%right)
            end if
            new_node => rotate_left(new_node)
        end if
    end function insert

    recursive subroutine inorder(node)
        type(avl_node), pointer, intent(in) :: node
        if (associated(node)) then
            call inorder(node%left)
            print *, node%value
            call inorder(node%right)
        end if
    end subroutine inorder
end module avl_tree_mod

program main
    use avl_tree_mod
    implicit none
    type(avl_node), pointer :: root => null()
    integer :: values(7) = [10, 20, 30, 40, 50, 25, 5]
    integer :: i

    do i = 1, 7
        root => insert(root, values(i))
    end do

    call inorder(root)
end program main
