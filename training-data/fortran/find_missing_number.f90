module find_missing_number_mod
    implicit none
contains
    integer function find_missing(arr, n)
        integer, intent(in) :: n
        integer, intent(in) :: arr(n)
        integer :: expected, actual
        expected = (n + 1) * (n + 2) / 2
        actual = sum(arr)
        find_missing = expected - actual
    end function find_missing
end module find_missing_number_mod

program main
    use find_missing_number_mod
    implicit none
    integer, parameter :: n = 4
    integer :: arr(n) = [1, 2, 4, 5]

    print *, find_missing(arr, n)
end program main
