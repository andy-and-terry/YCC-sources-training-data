program sorting_algorithms_in_place
    implicit none
    integer :: a(8) = [64, 25, 12, 22, 11, 90, 3, 47]
    integer :: b(8)
    b = a
    call insertion_sort(a)
    print *, a
    call quicksort(b, 1, size(b))
    print *, b
    print *, binary_search(a, 22), binary_search(a, 23)
contains
    subroutine insertion_sort(x)
        integer, intent(inout) :: x(:)
        integer :: i, j, key
        do i = 2, size(x)
            key = x(i)
            j = i - 1
            do while (j >= 1)
                if (x(j) <= key) exit
                x(j + 1) = x(j)
                j = j - 1
            end do
            x(j + 1) = key
        end do
    end subroutine insertion_sort

    recursive subroutine quicksort(x, lo, hi)
        integer, intent(inout) :: x(:)
        integer, intent(in) :: lo, hi
        integer :: p, i, j, t
        if (lo >= hi) return
        p = x((lo + hi) / 2); i = lo; j = hi
        do
            do while (x(i) < p); i = i + 1; end do
            do while (x(j) > p); j = j - 1; end do
            if (i <= j) then
                t = x(i); x(i) = x(j); x(j) = t
                i = i + 1; j = j - 1
            end if
            if (i > j) exit
        end do
        call quicksort(x, lo, j)
        call quicksort(x, i, hi)
    end subroutine quicksort

    integer function binary_search(x, key)
        integer, intent(in) :: x(:), key
        integer :: lo, hi, mid
        lo = 1; hi = size(x); binary_search = -1
        do while (lo <= hi)
            mid = (lo + hi) / 2
            if (x(mid) == key) then
                binary_search = mid; return
            else if (x(mid) < key) then
                lo = mid + 1
            else
                hi = mid - 1
            end if
        end do
    end function binary_search
end program sorting_algorithms_in_place
