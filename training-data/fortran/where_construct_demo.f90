program where_construct_demo
    implicit none
    integer :: arr(6) = [1, -2, 3, -4, 5, -6]

    where (arr < 0)
        arr = 0
    elsewhere
        arr = arr * 2
    end where

    print *, arr
end program where_construct_demo
