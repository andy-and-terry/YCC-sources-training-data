module kruskal_mst_mod
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
        integer :: rx, ry
        rx = find(parent, x)
        ry = find(parent, y)
        if (rx /= ry) parent(rx) = ry
    end subroutine union
end module kruskal_mst_mod

program main
    use kruskal_mst_mod
    implicit none
    integer, parameter :: n = 5, m = 7
    integer :: src(m)    = [1, 2, 1, 3, 2, 4, 3]
    integer :: dst(m)    = [3, 4, 2, 4, 3, 5, 5]
    integer :: weight(m) = [3, 4, 2, 5, 1, 7, 6]
    integer :: order(m)
    integer :: parent(n)
    integer :: i, j, temp, total_weight

    order = [(i, i = 1, m)]
    do i = 1, m - 1
        do j = 1, m - i
            if (weight(order(j)) > weight(order(j + 1))) then
                temp = order(j)
                order(j) = order(j + 1)
                order(j + 1) = temp
            end if
        end do
    end do

    parent = [(i, i = 1, n)]
    total_weight = 0
    do i = 1, m
        j = order(i)
        if (find(parent, src(j)) /= find(parent, dst(j))) then
            call union(parent, src(j), dst(j))
            total_weight = total_weight + weight(j)
        end if
    end do

    print *, total_weight
end program main
