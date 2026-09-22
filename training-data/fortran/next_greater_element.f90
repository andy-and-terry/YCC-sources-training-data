program next_greater_element
    implicit none
    integer, parameter :: n = 5
    integer :: arr(n) = [4, 5, 2, 10, 8]
    integer :: result(n)
    integer :: stack(n)
    integer :: top, i

    top = 0
    result = -1

    do i = n, 1, -1
        do while (top > 0)
            if (stack(top) <= arr(i)) then
                top = top - 1
            else
                exit
            end if
        end do
        if (top > 0) then
            result(i) = stack(top)
        end if
        top = top + 1
        stack(top) = arr(i)
    end do

    print *, result
end program next_greater_element
