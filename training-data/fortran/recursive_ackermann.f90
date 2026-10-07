program recursive_ackermann
    implicit none
    integer :: m, n

    do m = 0, 2
        do n = 0, 3
            write (*, '(A, I0, A, I0, A, I0)') "A(", m, ",", n, ") = ", ackermann(m, n)
        end do
    end do

contains

    recursive function ackermann(m, n) result(r)
        integer, intent(in) :: m, n
        integer :: r
        if (m == 0) then
            r = n + 1
        else if (n == 0) then
            r = ackermann(m - 1, 1)
        else
            r = ackermann(m - 1, ackermann(m, n - 1))
        end if
    end function ackermann

end program recursive_ackermann
