module floyd_warshall_mod
    implicit none
    integer, parameter :: inf = 999999
contains
    subroutine floyd_warshall(n, dist)
        integer, intent(in) :: n
        integer, intent(inout) :: dist(n, n)
        integer :: i, j, k

        do k = 1, n
            do i = 1, n
                do j = 1, n
                    if (dist(i, k) /= inf .and. dist(k, j) /= inf) then
                        if (dist(i, k) + dist(k, j) < dist(i, j)) then
                            dist(i, j) = dist(i, k) + dist(k, j)
                        end if
                    end if
                end do
            end do
        end do
    end subroutine floyd_warshall
end module floyd_warshall_mod

program main
    use floyd_warshall_mod
    implicit none
    integer, parameter :: n = 4
    integer :: dist(n, n)
    integer :: i

    dist = inf
    do i = 1, n
        dist(i, i) = 0
    end do
    dist(1, 2) = 3
    dist(1, 4) = 7
    dist(2, 3) = 1
    dist(3, 4) = 2
    dist(4, 1) = 1

    call floyd_warshall(n, dist)
    do i = 1, n
        print *, dist(i, :)
    end do
end program main
