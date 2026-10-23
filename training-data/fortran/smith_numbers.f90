! Smith numbers below 100: composite numbers whose digit sum equals
! the digit sum of their prime factors (counted with multiplicity).
program smith_numbers
    implicit none
    integer :: found(50), cnt, n

    cnt = 0
    do n = 4, 99
        if (is_smith(n)) then
            cnt = cnt + 1
            found(cnt) = n
        end if
    end do

    write(*, '(*(I0,:,1X))') found(1:cnt)

contains

    integer function digit_sum(n)
        integer, intent(in) :: n
        integer :: m
        digit_sum = 0
        m = n
        do while (m > 0)
            digit_sum = digit_sum + mod(m, 10)
            m = m / 10
        end do
    end function digit_sum

    logical function is_smith(n)
        integer, intent(in) :: n
        integer :: m, p, fsum, nf
        m = n
        fsum = 0
        nf = 0
        p = 2
        do while (p * p <= m)
            do while (mod(m, p) == 0)
                fsum = fsum + digit_sum(p)
                nf = nf + 1
                m = m / p
            end do
            p = p + 1
        end do
        if (m > 1) then
            fsum = fsum + digit_sum(m)
            nf = nf + 1
        end if
        is_smith = (nf > 1) .and. (fsum == digit_sum(n))
    end function is_smith

end program smith_numbers
