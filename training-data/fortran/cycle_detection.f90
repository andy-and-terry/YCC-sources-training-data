module cycle_detection_mod
    implicit none
contains
    recursive function dfs_has_cycle(node, adj, n, color) result(cyclic)
        integer, intent(in) :: node, n
        logical, intent(in) :: adj(n, n)
        integer, intent(inout) :: color(n)
        logical :: cyclic
        integer :: v

        color(node) = 1
        cyclic = .false.
        do v = 1, n
            if (adj(node, v)) then
                if (color(v) == 1) then
                    cyclic = .true.
                    return
                else if (color(v) == 0) then
                    if (dfs_has_cycle(v, adj, n, color)) then
                        cyclic = .true.
                        return
                    end if
                end if
            end if
        end do
        color(node) = 2
    end function dfs_has_cycle

    logical function has_cycle(adj, n) result(found)
        integer, intent(in) :: n
        logical, intent(in) :: adj(n, n)
        integer :: color(n), start

        color = 0
        found = .false.
        do start = 1, n
            if (color(start) == 0) then
                if (dfs_has_cycle(start, adj, n, color)) then
                    found = .true.
                    return
                end if
            end if
        end do
    end function has_cycle
end module cycle_detection_mod

program main
    use cycle_detection_mod
    implicit none
    integer, parameter :: n = 3
    logical :: acyclic(n, n), cyclic(n, n)

    acyclic = .false.
    acyclic(1, 2) = .true.
    acyclic(2, 3) = .true.

    cyclic = .false.
    cyclic(1, 2) = .true.
    cyclic(2, 3) = .true.
    cyclic(3, 1) = .true.

    print *, has_cycle(acyclic, n)
    print *, has_cycle(cyclic, n)
end program main
