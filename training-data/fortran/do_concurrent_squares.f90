program do_concurrent_squares
    implicit none
    integer :: i
    integer :: sq(6)
    do concurrent (i = 1:6)
        sq(i) = i * i
    end do
    print *, sq
end program do_concurrent_squares
