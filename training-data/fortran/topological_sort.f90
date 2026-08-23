module topo_sort_mod
    implicit none
contains
    recursive subroutine visit(node, adj, n, visited, order, order_size)
        integer, intent(in) :: node, n
        logical, intent(in) :: adj(n, n)
        logical, intent(inout) :: visited(n)
        integer, intent(inout) :: order(n)
        integer, intent(inout) :: order_size
        integer :: i

        if (visited(node)) return
        visited(node) = .true.
        do i = 1, n
            if (adj(node, i)) call visit(i, adj, n, visited, order, order_size)
        end do
        order_size = order_size + 1
        order(order_size) = node
    end subroutine visit
end module topo_sort_mod

program main
    use topo_sort_mod
    implicit none
    integer, parameter :: n = 4
    logical :: adj(n, n)
    logical :: visited(n)
    integer :: order(n)
    integer :: order_size, i

    adj = .false.
    adj(1, 2) = .true.
    adj(1, 3) = .true.
    adj(2, 4) = .true.
    adj(3, 4) = .true.

    visited = .false.
    order_size = 0
    do i = 1, n
        call visit(i, adj, n, visited, order, order_size)
    end do

    do i = n, 1, -1
        print *, order(i)
    end do
end program main
