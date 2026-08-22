program factorial
    implicit none
    integer :: i
    integer(8) :: result

    do i = 0, 10
        print *, i, compute_factorial(i)
    end do

contains

    function compute_factorial(n) result(res)
        integer, intent(in) :: n
        integer(8) :: res
        integer :: i

        res = 1
        do i = 2, n
            res = res * i
        end do
    end function compute_factorial

end program factorial
