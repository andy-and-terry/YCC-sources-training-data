module second_largest_mod
    implicit none
contains
    integer function second_largest(arr, n)
        integer, intent(in) :: n
        integer, intent(in) :: arr(n)
        integer :: largest, second, i
        largest = max(arr(1), arr(2))
        second = min(arr(1), arr(2))
        do i = 3, n
            if (arr(i) > largest) then
                second = largest
                largest = arr(i)
            else if (arr(i) > second) then
                second = arr(i)
            end if
        end do
        second_largest = second
    end function second_largest
end module second_largest_mod

program main
    use second_largest_mod
    implicit none
    integer, parameter :: n = 6
    integer :: arr(n) = [12, 35, 1, 10, 34, 1]

    print *, second_largest(arr, n)
end program main
