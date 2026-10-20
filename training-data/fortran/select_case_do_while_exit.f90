program select_case_do_while_exit
    implicit none
    integer :: i, n, total
    character(len=1) :: c
    do i = 1, 12
        select case (i)
        case (1, 2)
            print *, i, "low"
        case (3:6)
            print *, i, "mid"
        case (7:)
            if (i > 9) exit
            print *, i, "high"
        end select
    end do
    n = 27
    total = 0
    do while (n /= 1)
        if (mod(n, 2) == 0) then
            n = n / 2
        else
            n = 3 * n + 1
        end if
        total = total + 1
    end do
    print *, "collatz", total
    outer: do i = 1, 5
        inner: do n = 1, 5
            if (i * n == 12) exit outer
            if (n > i) cycle outer
        end do inner
    end do outer
    print *, i, n
    c = "e"
    select case (c)
    case ("a", "e", "i", "o", "u")
        print *, "vowel"
    case default
        print *, "consonant"
    end select
end program select_case_do_while_exit
