module sliding_window_maximum_mod
    implicit none
contains
    subroutine max_sliding_window(nums, n, k, result, result_len)
        integer, intent(in) :: n, k
        integer, intent(in) :: nums(n)
        integer, intent(out) :: result(n)
        integer, intent(out) :: result_len
        integer :: deque(n)
        integer :: front, back, i
        front = 1
        back = 0
        result_len = 0
        do i = 1, n
            do while (back >= front .and. nums(deque(back)) < nums(i))
                back = back - 1
            end do
            back = back + 1
            deque(back) = i
            if (deque(front) <= i - k) front = front + 1
            if (i >= k) then
                result_len = result_len + 1
                result(result_len) = nums(deque(front))
            end if
        end do
    end subroutine max_sliding_window
end module sliding_window_maximum_mod

program main
    use sliding_window_maximum_mod
    implicit none
    integer, parameter :: n = 8
    integer :: nums(n) = [1, 3, -1, -3, 5, 3, 6, 7]
    integer :: result(n)
    integer :: result_len

    call max_sliding_window(nums, n, 3, result, result_len)
    print *, result(1:result_len)
end program main
