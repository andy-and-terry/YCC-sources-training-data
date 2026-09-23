function is_palindrome_range(s, lo, hi) result(res)
    character(len=*), intent(in) :: s
    integer, intent(in) :: lo, hi
    logical :: res
    integer :: i, j

    res = .true.
    i = lo
    j = hi
    do while (i < j)
        if (s(i:i) /= s(j:j)) then
            res = .false.
            return
        end if
        i = i + 1
        j = j - 1
    end do
end function is_palindrome_range

program main
    implicit none
    character(len=*), parameter :: s = 'babadxyzzyx'
    logical :: is_palindrome_range
    integer :: n, i, j, best_len, best_start

    n = len(s)
    best_len = 1
    best_start = 1

    do i = 1, n
        do j = i, n
            if (j - i + 1 > best_len .and. is_palindrome_range(s, i, j)) then
                best_len = j - i + 1
                best_start = i
            end if
        end do
    end do

    print *, s(best_start:best_start + best_len - 1)
end program main
