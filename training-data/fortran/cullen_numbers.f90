! Cullen numbers: C(n) = n * 2^n + 1
program cullen_numbers
    implicit none
    integer(8) :: c(0:9)
    integer :: n

    do n = 0, 9
        c(n) = int(n, 8) * 2_8**n + 1_8
    end do

    write(*, '(*(I0,:,1X))') c
end program cullen_numbers
