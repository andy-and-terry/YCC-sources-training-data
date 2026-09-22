program bucket_sort
    implicit none
    integer, parameter :: n = 8, num_buckets = 5
    real :: arr(n) = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12]
    real, allocatable :: buckets(:, :)
    integer :: bucket_count(num_buckets)
    integer :: i, j, idx, k, out_pos
    real :: key

    allocate (buckets(num_buckets, n))
    bucket_count = 0

    do i = 1, n
        idx = int(arr(i) * num_buckets) + 1
        if (idx > num_buckets) idx = num_buckets
        bucket_count(idx) = bucket_count(idx) + 1
        buckets(idx, bucket_count(idx)) = arr(i)
    end do

    do i = 1, num_buckets
        do j = 2, bucket_count(i)
            key = buckets(i, j)
            k = j - 1
            do while (k >= 1 .and. buckets(i, k) > key)
                buckets(i, k + 1) = buckets(i, k)
                k = k - 1
            end do
            buckets(i, k + 1) = key
        end do
    end do

    out_pos = 0
    do i = 1, num_buckets
        do j = 1, bucket_count(i)
            out_pos = out_pos + 1
            arr(out_pos) = buckets(i, j)
        end do
    end do

    print *, arr
    deallocate (buckets)
end program bucket_sort
