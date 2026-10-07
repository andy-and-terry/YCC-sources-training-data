program shell_sort
    implicit none
    integer :: arr(8) = [23, 12, 1, 8, 34, 54, 2, 3]
    integer :: n, gap, i, j, temp

    n = size(arr)
    gap = n / 2
    do while (gap > 0)
        do i = gap + 1, n
            temp = arr(i)
            j = i
            do while (j > gap)
                if (arr(j - gap) <= temp) exit
                arr(j) = arr(j - gap)
                j = j - gap
            end do
            arr(j) = temp
        end do
        gap = gap / 2
    end do

    print *, arr
end program shell_sort
