module bellman_ford_mod
    implicit none
contains
    subroutine bellman_ford(src_list, dst_list, weight, n, m, source, dist)
        integer, intent(in) :: src_list(:), dst_list(:), weight(:)
        integer, intent(in) :: n, m, source
        integer, intent(out) :: dist(n)
        integer, parameter :: inf = 999999
        integer :: i, k, u, v, w

        dist = inf
        dist(source) = 0
        do i = 1, n - 1
            do k = 1, m
                u = src_list(k)
                v = dst_list(k)
                w = weight(k)
                if (dist(u) /= inf .and. dist(u) + w < dist(v)) then
                    dist(v) = dist(u) + w
                end if
            end do
        end do
    end subroutine bellman_ford
end module bellman_ford_mod

program main
    use bellman_ford_mod
    implicit none
    integer, parameter :: n = 5, m = 8
    integer :: src_list(m) = [1, 1, 2, 2, 3, 4, 4, 5]
    integer :: dst_list(m) = [2, 3, 3, 4, 4, 2, 5, 4]
    integer :: weight(m)   = [6, 7, 8, 5, -3, -2, 9, 7]
    integer :: dist(n)

    call bellman_ford(src_list, dst_list, weight, n, m, 1, dist)
    print *, dist
end program main
