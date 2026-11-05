program where_construct_masking
    implicit none
    real :: x(5) = [-2.0, 1.0, -0.5, 4.0, 0.0]
    where (x < 0.0)
        x = 0.0
    elsewhere
        x = x * 2.0
    end where
    print *, x
end program where_construct_masking
