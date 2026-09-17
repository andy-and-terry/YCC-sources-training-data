module bellman_ford_mod
    implicit none
    integer, parameter :: inf = 999999
contains
    subroutine bellman_ford(n, edges, m, source, dist, has_negative_cycle)
        integer, intent(in) :: n, m, source
        integer, intent(in) :: edges(m, 3)
        integer, intent(out) :: dist(n)
        logical, intent(out) :: has_negative_cycle
        integer :: i, k, u, v, w

        dist = inf
        dist(source) = 0
        has_negative_cycle = .false.

        do k = 1, n - 1
            do i = 1, m
                u = edges(i, 1)
                v = edges(i, 2)
                w = edges(i, 3)
                if (dist(u) /= inf .and. dist(u) + w < dist(v)) then
                    dist(v) = dist(u) + w
                end if
            end do
        end do

        do i = 1, m
            u = edges(i, 1)
            v = edges(i, 2)
            w = edges(i, 3)
            if (dist(u) /= inf .and. dist(u) + w < dist(v)) then
                has_negative_cycle = .true.
            end if
        end do
    end subroutine bellman_ford
end module bellman_ford_mod

program main
    use bellman_ford_mod
    implicit none
    integer, parameter :: n = 5, m = 8
    integer :: edges(m, 3)
    integer :: dist(n)
    logical :: has_negative_cycle

    edges(1, :) = [1, 2, -1]
    edges(2, :) = [1, 3, 4]
    edges(3, :) = [2, 3, 3]
    edges(4, :) = [2, 4, 2]
    edges(5, :) = [2, 5, 2]
    edges(6, :) = [4, 3, 5]
    edges(7, :) = [4, 2, 1]
    edges(8, :) = [5, 4, -3]

    call bellman_ford(n, edges, m, 1, dist, has_negative_cycle)
    print *, dist
    print *, has_negative_cycle
end program main
