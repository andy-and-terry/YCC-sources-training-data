program is_prime
    implicit none
    integer :: n, i
    logical :: prime

    do n = 2, 20
        prime = .true.
        do i = 2, int(sqrt(real(n)))
            if (mod(n, i) == 0) then
                prime = .false.
                exit
            end if
        end do
        if (prime) then
            print *, n
        end if
    end do
end program is_prime
