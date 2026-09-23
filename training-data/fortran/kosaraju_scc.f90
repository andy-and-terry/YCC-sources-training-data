module kosaraju_mod
    implicit none
contains
    recursive subroutine fill_order(node, adj, n, visited, order, order_size)
        integer, intent(in) :: node, n
        logical, intent(in) :: adj(n, n)
        logical, intent(inout) :: visited(n)
        integer, intent(inout) :: order(n)
        integer, intent(inout) :: order_size
        integer :: v

        visited(node) = .true.
        do v = 1, n
            if (adj(node, v) .and. .not. visited(v)) call fill_order(v, adj, n, visited, order, order_size)
        end do
        order_size = order_size + 1
        order(order_size) = node
    end subroutine fill_order

    recursive subroutine collect(node, adj_t, n, visited, component, comp_size)
        integer, intent(in) :: node, n
        logical, intent(in) :: adj_t(n, n)
        logical, intent(inout) :: visited(n)
        integer, intent(inout) :: component(n)
        integer, intent(inout) :: comp_size
        integer :: v

        visited(node) = .true.
        comp_size = comp_size + 1
        component(comp_size) = node
        do v = 1, n
            if (adj_t(node, v) .and. .not. visited(v)) call collect(v, adj_t, n, visited, component, comp_size)
        end do
    end subroutine collect
end module kosaraju_mod

program main
    use kosaraju_mod
    implicit none
    integer, parameter :: n = 5
    logical :: adj(n, n), adj_t(n, n)
    logical :: visited(n)
    integer :: order(n), order_size
    integer :: component(n), comp_size
    integer :: i, j, idx

    adj = .false.
    adj(1, 2) = .true.
    adj(2, 3) = .true.
    adj(3, 1) = .true.
    adj(3, 4) = .true.
    adj(4, 5) = .true.

    adj_t = .false.
    do i = 1, n
        do j = 1, n
            if (adj(i, j)) adj_t(j, i) = .true.
        end do
    end do

    visited = .false.
    order_size = 0
    do i = 1, n
        if (.not. visited(i)) call fill_order(i, adj, n, visited, order, order_size)
    end do

    visited = .false.
    do idx = n, 1, -1
        i = order(idx)
        if (.not. visited(i)) then
            comp_size = 0
            call collect(i, adj_t, n, visited, component, comp_size)
            print *, component(1:comp_size)
        end if
    end do
end program main
