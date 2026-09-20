program breadth_first_search
    implicit none
    integer, parameter :: n = 6
    integer :: graph(n, n)
    logical :: visited(n)
    integer :: queue(n), front, back
    integer :: u, v, order(n), order_count

    graph = 0
    graph(1, 2) = 1; graph(2, 1) = 1
    graph(1, 3) = 1; graph(3, 1) = 1
    graph(2, 4) = 1; graph(4, 2) = 1
    graph(3, 5) = 1; graph(5, 3) = 1
    graph(4, 6) = 1; graph(6, 4) = 1
    graph(5, 6) = 1; graph(6, 5) = 1

    visited = .false.
    queue = 0
    front = 1
    back = 0
    order_count = 0

    back = back + 1
    queue(back) = 1
    visited(1) = .true.

    do while (front <= back)
        u = queue(front)
        front = front + 1
        order_count = order_count + 1
        order(order_count) = u
        do v = 1, n
            if (graph(u, v) == 1 .and. .not. visited(v)) then
                visited(v) = .true.
                back = back + 1
                queue(back) = v
            end if
        end do
    end do

    print *, order
end program breadth_first_search
