module bipartite_mod
    implicit none
contains
    logical function is_bipartite(adj, n) result(bipartite)
        integer, intent(in) :: n
        logical, intent(in) :: adj(n, n)
        integer :: color(n)
        integer :: queue(n)
        integer :: head, tail, u, v, start

        color = 0
        bipartite = .true.

        do start = 1, n
            if (color(start) /= 0) cycle
            color(start) = 1
            head = 1
            tail = 1
            queue(tail) = start

            do while (head <= tail)
                u = queue(head)
                head = head + 1
                do v = 1, n
                    if (adj(u, v)) then
                        if (color(v) == 0) then
                            color(v) = -color(u)
                            tail = tail + 1
                            queue(tail) = v
                        else if (color(v) == color(u)) then
                            bipartite = .false.
                        end if
                    end if
                end do
            end do
        end do
    end function is_bipartite
end module bipartite_mod

program main
    use bipartite_mod
    implicit none
    integer, parameter :: n = 4
    logical :: adj(n, n)

    adj = .false.
    adj(1, 2) = .true.
    adj(2, 1) = .true.
    adj(2, 3) = .true.
    adj(3, 2) = .true.
    adj(3, 4) = .true.
    adj(4, 3) = .true.
    adj(4, 1) = .true.
    adj(1, 4) = .true.

    print *, is_bipartite(adj, n)
end program main
