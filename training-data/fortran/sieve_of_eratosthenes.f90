program sieve_of_eratosthenes
    implicit none
    integer, parameter :: limit = 50
    logical :: is_composite(2:limit)
    integer :: i, j

    is_composite = .false.
    do i = 2, int(sqrt(real(limit)))
        if (.not. is_composite(i)) then
            do j = i * i, limit, i
                is_composite(j) = .true.
            end do
        end if
    end do

    do i = 2, limit
        if (.not. is_composite(i)) print *, i
    end do
end program sieve_of_eratosthenes
