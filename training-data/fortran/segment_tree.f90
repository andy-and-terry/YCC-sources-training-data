module segment_tree_mod
    implicit none
contains
    recursive subroutine build(tree, arr, node, lo, hi)
        integer, intent(inout) :: tree(:)
        integer, intent(in) :: arr(:)
        integer, intent(in) :: node, lo, hi
        integer :: mid
        if (lo == hi) then
            tree(node) = arr(lo)
        else
            mid = (lo + hi) / 2
            call build(tree, arr, 2 * node, lo, mid)
            call build(tree, arr, 2 * node + 1, mid + 1, hi)
            tree(node) = tree(2 * node) + tree(2 * node + 1)
        end if
    end subroutine build

    recursive function query(tree, node, lo, hi, l, r) result(res)
        integer, intent(in) :: tree(:)
        integer, intent(in) :: node, lo, hi, l, r
        integer :: res, mid, left_sum, right_sum
        if (r < lo .or. hi < l) then
            res = 0
        else if (l <= lo .and. hi <= r) then
            res = tree(node)
        else
            mid = (lo + hi) / 2
            left_sum = query(tree, 2 * node, lo, mid, l, r)
            right_sum = query(tree, 2 * node + 1, mid + 1, hi, l, r)
            res = left_sum + right_sum
        end if
    end function query
end module segment_tree_mod

program main
    use segment_tree_mod
    implicit none
    integer, parameter :: n = 6
    integer :: arr(n) = [1, 3, 5, 7, 9, 11]
    integer :: tree(4 * n)

    tree = 0
    call build(tree, arr, 1, 1, n)
    print *, query(tree, 1, 1, n, 2, 4)
    print *, query(tree, 1, 1, n, 1, 6)
end program main
