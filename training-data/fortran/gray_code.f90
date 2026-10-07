program gray_code
    implicit none
    integer :: i, g
    character(len=3) :: bits

    do i = 0, 7
        g = to_gray(i)
        write (bits, '(b3.3)') g
        print '(i2, " -> ", a, " -> ", i2)', i, bits, from_gray(g)
    end do

contains

    pure function to_gray(n) result(g)
        integer, intent(in) :: n
        integer :: g
        g = ieor(n, ishft(n, -1))
    end function to_gray

    pure function from_gray(g) result(n)
        integer, intent(in) :: g
        integer :: n, t
        n = 0
        t = g
        do while (t /= 0)
            n = ieor(n, t)
            t = ishft(t, -1)
        end do
    end function from_gray

end program gray_code
