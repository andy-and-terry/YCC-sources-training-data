module counting_sort_mod
    implicit none
contains
    subroutine counting_sort(arr, max_val)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: max_val
        integer :: counts(0:max_val)
        integer :: i, v, out_idx

        counts = 0
        do i = 1, size(arr)
            counts(arr(i)) = counts(arr(i)) + 1
        end do

        out_idx = 1
        do v = 0, max_val
            do while (counts(v) > 0)
                arr(out_idx) = v
                out_idx = out_idx + 1
                counts(v) = counts(v) - 1
            end do
        end do
    end subroutine counting_sort
end module counting_sort_mod

program main
    use counting_sort_mod
    implicit none
    integer :: arr(8) = [4, 2, 9, 6, 2, 1, 9, 4]

    call counting_sort(arr, 9)
    print *, arr
end program main
