program palindromic_number
    implicit none
    integer :: n

    do n = 100, 200
        if (is_pal(n)) write (*, '(i4)', advance='no') n
    end do
    print *

contains

    logical function is_pal(k)
        integer, intent(in) :: k
        integer :: rev, t
        rev = 0
        t = k
        do while (t > 0)
            rev = rev * 10 + mod(t, 10)
            t = t / 10
        end do
        is_pal = (rev == k)
    end function is_pal

end program palindromic_number
