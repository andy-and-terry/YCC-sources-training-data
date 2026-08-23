module union_find_mod
    implicit none
contains
    recursive function find(parent, x) result(root)
        integer, intent(in) :: parent(:)
        integer, intent(in) :: x
        integer :: root
        if (parent(x) == x) then
            root = x
        else
            root = find(parent, parent(x))
        end if
    end function find

    subroutine union(parent, x, y)
        integer, intent(inout) :: parent(:)
        integer, intent(in) :: x, y
        integer :: root_x, root_y
        root_x = find(parent, x)
        root_y = find(parent, y)
        if (root_x /= root_y) parent(root_x) = root_y
    end subroutine union
end module union_find_mod

program main
    use union_find_mod
    implicit none
    integer :: parent(5) = [1, 2, 3, 4, 5]
    call union(parent, 1, 2)
    call union(parent, 2, 3)
    print *, find(parent, 1) == find(parent, 3)
    print *, find(parent, 1) == find(parent, 4)
end program main
