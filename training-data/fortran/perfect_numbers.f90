program perfect_numbers
    implicit none
    integer :: n, d, s

    do n = 2, 10000
        s = 1
        d = 2
        do while (d * d <= n)
            if (mod(n, d) == 0) then
                s = s + d
                if (d /= n / d) s = s + n / d
            end if
            d = d + 1
        end do
        if (s == n) print *, n, 'is perfect'
    end do
end program perfect_numbers
