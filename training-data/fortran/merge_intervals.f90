module merge_intervals_mod
    implicit none
contains
    subroutine sort_by_start(starts, ends, n)
        integer, intent(in) :: n
        integer, intent(inout) :: starts(n), ends(n)
        integer :: i, j, tmp
        do i = 1, n - 1
            do j = 1, n - i
                if (starts(j) > starts(j + 1)) then
                    tmp = starts(j); starts(j) = starts(j + 1); starts(j + 1) = tmp
                    tmp = ends(j); ends(j) = ends(j + 1); ends(j + 1) = tmp
                end if
            end do
        end do
    end subroutine sort_by_start

    subroutine merge(starts, ends, n, out_starts, out_ends, out_count)
        integer, intent(in) :: n
        integer, intent(inout) :: starts(n), ends(n)
        integer, intent(out) :: out_starts(n), out_ends(n)
        integer, intent(out) :: out_count
        integer :: i
        call sort_by_start(starts, ends, n)
        out_count = 1
        out_starts(1) = starts(1)
        out_ends(1) = ends(1)
        do i = 2, n
            if (starts(i) <= out_ends(out_count)) then
                out_ends(out_count) = max(out_ends(out_count), ends(i))
            else
                out_count = out_count + 1
                out_starts(out_count) = starts(i)
                out_ends(out_count) = ends(i)
            end if
        end do
    end subroutine merge
end module merge_intervals_mod

program main
    use merge_intervals_mod
    implicit none
    integer, parameter :: n = 4
    integer :: starts(n) = [1, 2, 8, 15]
    integer :: ends(n) = [3, 6, 10, 18]
    integer :: out_starts(n), out_ends(n)
    integer :: out_count, i

    call merge(starts, ends, n, out_starts, out_ends, out_count)
    do i = 1, out_count
        print *, out_starts(i), out_ends(i)
    end do
end program main
