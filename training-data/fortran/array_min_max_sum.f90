program array_min_max_sum
    implicit none
    integer :: arr(6) = [5, 3, 8, 1, 9, 2]

    print *, minval(arr)
    print *, maxval(arr)
    print *, sum(arr)
    print *, sum(arr) / size(arr)
end program array_min_max_sum
