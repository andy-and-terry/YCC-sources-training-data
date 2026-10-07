module bfs_mod
    implicit none
contains
    subroutine bfs(adj, n, start, order, order_size)
        integer, intent(in) :: n, start
        logical, intent(in) :: adj(n, n)
        integer, intent(out) :: order(n)
        integer, intent(out) :: order_size
        logical :: visited(n)
        integer :: queue(n)
        integer :: head, tail, u, v

        visited = .false.
        order_size = 0
        head = 1
        tail = 1
        queue(tail) = start
        visited(start) = .true.

        do while (head <= tail)
            u = queue(head)
            head = head + 1
            order_size = order_size + 1
            order(order_size) = u
            do v = 1, n
                if (adj(u, v) .and. .not. visited(v)) then
                    visited(v) = .true.
                    tail = tail + 1
                    queue(tail) = v
                end if
            end do
        end do
    end subroutine bfs
end module bfs_mod

program main
    use bfs_mod
    implicit none
    integer, parameter :: n = 5
    logical :: adj(n, n)
    integer :: order(n)
    integer :: order_size

    adj = .false.
    adj(1, 2) = .true.
    adj(1, 3) = .true.
    adj(2, 4) = .true.
    adj(3, 4) = .true.
    adj(4, 5) = .true.

    call bfs(adj, n, 1, order, order_size)
    print *, order(1:order_size)
end program main
