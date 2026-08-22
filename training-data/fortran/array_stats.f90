program array_stats
    implicit none
    integer :: arr(6) = [5, 3, 8, 1, 9, 2]

    print *, sum(arr)
    print *, maxval(arr)
    print *, minval(arr)
    print *, real(sum(arr)) / size(arr)
end program array_stats
