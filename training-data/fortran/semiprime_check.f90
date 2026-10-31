program semiprime_check
    implicit none
    integer :: n
    do n = 2, 29
        if (prime_factor_count(n) == 2) write (*, '(I0, 1X)', advance='no') n
    end do
    print *
contains
    integer function prime_factor_count(n)
        integer, intent(in) :: n
        integer :: m, p
        m = n
        p = 2
        prime_factor_count = 0
        do while (p * p <= m)
            do while (mod(m, p) == 0)
                m = m / p
                prime_factor_count = prime_factor_count + 1
            end do
            p = p + 1
        end do
        if (m > 1) prime_factor_count = prime_factor_count + 1
    end function prime_factor_count
end program semiprime_check
