program prime_factorization
    implicit none
    integer :: num, d, cnt
    integer :: factors(20)

    num = 360
    d = 2
    cnt = 0

    do while (num > 1)
        do while (mod(num, d) == 0)
            cnt = cnt + 1
            factors(cnt) = d
            num = num / d
        end do
        d = d + 1
    end do

    print *, factors(1:cnt)
end program prime_factorization
