! Woodall numbers: W(n) = n * 2^n - 1
program woodall_numbers
    implicit none
    integer(8) :: w(1:10)
    integer :: n

    do n = 1, 10
        w(n) = int(n, 8) * 2_8**n - 1_8
    end do

    write(*, '(*(I0,:,1X))') w
end program woodall_numbers
