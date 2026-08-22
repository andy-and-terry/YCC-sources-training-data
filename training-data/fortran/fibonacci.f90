program fibonacci
    implicit none
    integer :: i, a, b, temp

    a = 0
    b = 1
    do i = 0, 10
        print *, a
        temp = a + b
        a = b
        b = temp
    end do
end program fibonacci
