module prim_mst_mod
    implicit none
contains
    function prim_mst(graph, n) result(total_weight)
        integer, intent(in) :: graph(n, n)
        integer, intent(in) :: n
        integer :: total_weight
        integer, parameter :: inf = 999999
        integer :: key(n), parent(n)
        logical :: in_mst(n)
        integer :: i, j, u, min_key

        key = inf
        in_mst = .false.
        key(1) = 0
        parent(1) = 0
        total_weight = 0

        do i = 1, n
            min_key = inf
            u = -1
            do j = 1, n
                if (.not. in_mst(j) .and. key(j) < min_key) then
                    min_key = key(j)
                    u = j
                end if
            end do
            if (u == -1) exit
            in_mst(u) = .true.
            total_weight = total_weight + key(u)
            do j = 1, n
                if (graph(u, j) /= 0 .and. .not. in_mst(j) .and. graph(u, j) < key(j)) then
                    key(j) = graph(u, j)
                    parent(j) = u
                end if
            end do
        end do
    end function prim_mst
end module prim_mst_mod

program main
    use prim_mst_mod
    implicit none
    integer, parameter :: n = 5
    integer :: graph(n, n)

    graph = 0
    graph(1, 2) = 2; graph(2, 1) = 2
    graph(1, 3) = 3; graph(3, 1) = 3
    graph(2, 3) = 1; graph(3, 2) = 1
    graph(2, 4) = 4; graph(4, 2) = 4
    graph(3, 4) = 5; graph(4, 3) = 5
    graph(3, 5) = 6; graph(5, 3) = 6
    graph(4, 5) = 7; graph(5, 4) = 7

    print *, prim_mst(graph, n)
end program main
