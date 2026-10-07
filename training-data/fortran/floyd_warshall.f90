program floyd_warshall
    implicit none
    integer, parameter :: n = 4, inf = 999999
    integer :: dist(n, n)
    integer :: i, j, k

    dist = inf
    do i = 1, n
        dist(i, i) = 0
    end do
    dist(1, 2) = 3
    dist(1, 3) = 8
    dist(2, 4) = 1
    dist(3, 2) = 4
    dist(4, 1) = 2
    dist(4, 3) = 5

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

    do i = 1, n
        print *, dist(i, :)
    end do
end program floyd_warshall
