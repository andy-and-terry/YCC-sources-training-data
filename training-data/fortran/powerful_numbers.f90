program powerful_numbers
    implicit none
    integer :: n
    do n = 1, 100
        if (is_powerful(n)) write (*, '(I0, 1X)', advance='no') n
    end do
    print *
contains
    logical function is_powerful(n)
        integer, intent(in) :: n
        integer :: m, p
        m = n
        p = 2
        is_powerful = .false.
        do while (p * p <= m)
            if (mod(m, p) == 0) then
                if (mod(m, p * p) /= 0) return
                do while (mod(m, p) == 0)
                    m = m / p
                end do
            end if
            p = p + 1
        end do
        is_powerful = (m == 1)
    end function is_powerful
end program powerful_numbers
