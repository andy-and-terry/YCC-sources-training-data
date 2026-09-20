program bucket_sort
    implicit none
    integer, parameter :: n = 8, nbuckets = 5
    real :: arr(n) = [0.42, 0.32, 0.23, 0.52, 0.25, 0.77, 0.65, 0.89]
    real :: buckets(nbuckets, n)
    integer :: bucket_count(nbuckets)
    integer :: i, j, idx, k, pos
    real :: temp

    bucket_count = 0

    do i = 1, n
        idx = int(arr(i) * nbuckets) + 1
        if (idx > nbuckets) idx = nbuckets
        bucket_count(idx) = bucket_count(idx) + 1
        buckets(idx, bucket_count(idx)) = arr(i)
    end do

    ! insertion sort within each bucket
    do i = 1, nbuckets
        do j = 2, bucket_count(i)
            temp = buckets(i, j)
            k = j - 1
            do while (k >= 1 .and. buckets(i, k) > temp)
                buckets(i, k + 1) = buckets(i, k)
                k = k - 1
            end do
            buckets(i, k + 1) = temp
        end do
    end do

    pos = 0
    do i = 1, nbuckets
        do j = 1, bucket_count(i)
            pos = pos + 1
            arr(pos) = buckets(i, j)
        end do
    end do

    print *, arr
end program bucket_sort
