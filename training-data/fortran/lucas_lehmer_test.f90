! Lucas-Lehmer test: Mersenne prime exponents p <= 19.
program lucas_lehmer_test
    implicit none
    integer :: found(20), cnt, p

    cnt = 0
    do p = 2, 19
        if (is_prime(p) .and. is_mersenne_exponent(p)) then
            cnt = cnt + 1
            found(cnt) = p
        end if
    end do

    write(*, '(*(I0,:,1X))') found(1:cnt)

contains

    logical function is_prime(n)
        integer, intent(in) :: n
        integer :: d
        is_prime = n >= 2
        d = 2
        do while (is_prime .and. d * d <= n)
            if (mod(n, d) == 0) is_prime = .false.
            d = d + 1
        end do
    end function is_prime

    logical function is_mersenne_exponent(p)
        integer, intent(in) :: p
        integer(8) :: m, s
        integer :: i
        if (p == 2) then
            is_mersenne_exponent = .true.
            return
        end if
        m = 2_8**p - 1_8
        s = 4_8
        do i = 1, p - 2
            s = modulo(s * s - 2_8, m)
        end do
        is_mersenne_exponent = (s == 0_8)
    end function is_mersenne_exponent

end program lucas_lehmer_test
