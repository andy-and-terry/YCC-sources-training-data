program prime_factorization
    implicit none
    integer :: num, factor

    num = 360
    factor = 2

    do while (num > 1)
        if (mod(num, factor) == 0) then
            print *, factor
            num = num / factor
        else
            factor = factor + 1
        end if
    end do
end program prime_factorization
