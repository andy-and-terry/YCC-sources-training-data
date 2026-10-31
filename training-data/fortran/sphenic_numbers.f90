program sphenic_numbers
    implicit none
    integer :: n
    do n = 2, 79
        if (is_sphenic(n)) write (*, '(I0, 1X)', advance='no') n
    end do
    print *
contains
    logical function is_sphenic(n)
        integer, intent(in) :: n
        integer :: m, p, distinct
        m = n
        p = 2
        distinct = 0
        is_sphenic = .false.
        do while (p * p <= m)
            if (mod(m, p) == 0) then
                m = m / p
                if (mod(m, p) == 0) return
                distinct = distinct + 1
            end if
            p = p + 1
        end do
        if (m > 1) distinct = distinct + 1
        is_sphenic = (distinct == 3)
    end function is_sphenic
end program sphenic_numbers
