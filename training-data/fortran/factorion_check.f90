program factorion_check
    implicit none
    integer, parameter :: fact(0:9) = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
    integer :: n, m, total
    do n = 1, 49999
        total = 0
        m = n
        do while (m > 0)
            total = total + fact(mod(m, 10))
            m = m / 10
        end do
        if (total == n) write (*, '(I0, 1X)', advance='no') n
    end do
    print *
end program factorion_check
