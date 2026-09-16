module fenwick_tree_mod
    implicit none
contains
    subroutine update(tree, n, i, delta)
        integer, intent(inout) :: tree(:)
        integer, intent(in) :: n, i, delta
        integer :: idx
        idx = i
        do while (idx <= n)
            tree(idx) = tree(idx) + delta
            idx = idx + iand(idx, -idx)
        end do
    end subroutine update

    integer function prefix_sum(tree, i) result(total)
        integer, intent(in) :: tree(:)
        integer, intent(in) :: i
        integer :: idx
        total = 0
        idx = i
        do while (idx > 0)
            total = total + tree(idx)
            idx = idx - iand(idx, -idx)
        end do
    end function prefix_sum

    integer function range_sum(tree, l, r) result(total)
        integer, intent(in) :: tree(:)
        integer, intent(in) :: l, r
        total = prefix_sum(tree, r) - prefix_sum(tree, l - 1)
    end function range_sum
end module fenwick_tree_mod

program main
    use fenwick_tree_mod
    implicit none
    integer, parameter :: n = 6
    integer :: tree(n) = 0
    integer :: values(n) = [3, 2, -1, 6, 5, 4]
    integer :: i

    do i = 1, n
        call update(tree, n, i, values(i))
    end do

    print *, range_sum(tree, 2, 4)
    print *, range_sum(tree, 1, 6)
end program main
