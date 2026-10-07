program josephus_problem
    implicit none
    integer, parameter :: n = 7, k = 3
    logical :: alive(n)
    integer :: count_alive, idx, step

    alive = .true.
    count_alive = n
    idx = 0

    do while (count_alive > 1)
        step = 0
        do while (step < k)
            idx = mod(idx, n) + 1
            if (alive(idx)) step = step + 1
        end do
        alive(idx) = .false.
        count_alive = count_alive - 1
    end do

    do idx = 1, n
        if (alive(idx)) print *, idx
    end do
end program josephus_problem
