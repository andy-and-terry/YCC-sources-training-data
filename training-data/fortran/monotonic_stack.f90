module monotonic_stack_mod
    implicit none
contains
    subroutine next_greater(nums, n, result)
        integer, intent(in) :: n
        integer, intent(in) :: nums(n)
        integer, intent(out) :: result(n)
        integer :: stack(n)
        integer :: sp, i
        sp = 0
        result = -1
        do i = 1, n
            do while (sp > 0)
                if (nums(stack(sp)) >= nums(i)) exit
                result(stack(sp)) = nums(i)
                sp = sp - 1
            end do
            sp = sp + 1
            stack(sp) = i
        end do
    end subroutine next_greater
end module monotonic_stack_mod

program main
    use monotonic_stack_mod
    implicit none
    integer, parameter :: n = 6
    integer :: nums(n) = [4, 5, 2, 25, 7, 8]
    integer :: result(n)

    call next_greater(nums, n, result)
    print *, result
end program main
