program dijkstra
    implicit none
    integer, parameter :: n = 4, inf = 999999
    integer :: graph(n, n)
    integer :: dist(n)
    logical :: visited(n)
    integer :: i, j, u, min_dist

    graph = inf
    graph(1, 2) = 1
    graph(1, 3) = 4
    graph(2, 3) = 2
    graph(2, 4) = 5
    graph(3, 4) = 1

    dist = inf
    dist(1) = 0
    visited = .false.

    do i = 1, n
        min_dist = inf
        u = -1
        do j = 1, n
            if (.not. visited(j) .and. dist(j) < min_dist) then
                min_dist = dist(j)
                u = j
            end if
        end do
        if (u == -1) exit
        visited(u) = .true.
        do j = 1, n
            if (graph(u, j) /= inf .and. dist(u) + graph(u, j) < dist(j)) then
                dist(j) = dist(u) + graph(u, j)
            end if
        end do
    end do

    print *, dist
end program dijkstra
