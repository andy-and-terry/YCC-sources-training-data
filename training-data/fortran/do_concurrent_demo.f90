program do_concurrent_demo
    implicit none
    integer, parameter :: n = 10
    integer :: a(n), b(n), c(n)
    integer :: i

    do i = 1, n
        a(i) = i
        b(i) = i * i
    end do

    do concurrent (i = 1:n)
        c(i) = a(i) + b(i)
    end do

    print *, c
end program do_concurrent_demo
