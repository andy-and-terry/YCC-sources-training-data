program bellman_ford
    implicit none
    integer, parameter :: n = 5, num_edges = 8, inf = 999999
    integer :: src(num_edges) = [1, 1, 2, 2, 3, 4, 4, 5]
    integer :: dst(num_edges) = [2, 3, 3, 4, 4, 2, 5, 4]
    integer :: weight(num_edges) = [6, 7, 8, 5, -3, -2, 9, 7]
    integer :: dist(n)
    integer :: i, j, u, v, w
    logical :: negative_cycle

    dist = inf
    dist(1) = 0

    do i = 1, n - 1
        do j = 1, num_edges
            u = src(j)
            v = dst(j)
            w = weight(j)
            if (dist(u) /= inf .and. dist(u) + w < dist(v)) then
                dist(v) = dist(u) + w
            end if
        end do
    end do

    negative_cycle = .false.
    do j = 1, num_edges
        u = src(j)
        v = dst(j)
        w = weight(j)
        if (dist(u) /= inf .and. dist(u) + w < dist(v)) then
            negative_cycle = .true.
        end if
    end do

    print *, dist
    print *, negative_cycle
end program bellman_ford
