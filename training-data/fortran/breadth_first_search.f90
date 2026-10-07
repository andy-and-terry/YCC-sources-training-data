program breadth_first_search
    implicit none
    integer, parameter :: n = 6
    logical :: adj(n, n)
    logical :: visited(n)
    integer :: queue(n)
    integer :: head, tail, cur, i

    adj = .false.
    adj(1, 2) = .true.
    adj(1, 3) = .true.
    adj(2, 4) = .true.
    adj(3, 4) = .true.
    adj(4, 5) = .true.
    adj(5, 6) = .true.

    visited = .false.
    head = 1
    tail = 1
    queue(tail) = 1
    tail = tail + 1
    visited(1) = .true.

    do while (head < tail)
        cur = queue(head)
        head = head + 1
        print *, cur
        do i = 1, n
            if (adj(cur, i) .and. .not. visited(i)) then
                visited(i) = .true.
                queue(tail) = i
                tail = tail + 1
            end if
        end do
    end do
end program breadth_first_search
