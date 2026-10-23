program digital_root
    implicit none
    integer(kind=8), parameter :: samples(4) = [16_8, 942_8, 132189_8, 493193_8]
    integer :: i

    do i = 1, size(samples)
        print '(A, I0, A, I0, A, I0, A, I0)', "digital root of ", samples(i), &
            " = ", iterative_root(samples(i)), " (persistence ", &
            persistence(samples(i)), ", formula ", formula_root(samples(i))
    end do

contains

    integer(kind=8) function digit_sum(n)
        integer(kind=8), intent(in) :: n
        integer(kind=8) :: m

        m = n
        digit_sum = 0
        do while (m > 0)
            digit_sum = digit_sum + mod(m, 10_8)
            m = m / 10
        end do
    end function digit_sum

    integer(kind=8) function iterative_root(n)
        integer(kind=8), intent(in) :: n

        iterative_root = n
        do while (iterative_root >= 10)
            iterative_root = digit_sum(iterative_root)
        end do
    end function iterative_root

    integer function persistence(n)
        integer(kind=8), intent(in) :: n
        integer(kind=8) :: m

        m = n
        persistence = 0
        do while (m >= 10)
            m = digit_sum(m)
            persistence = persistence + 1
        end do
    end function persistence

    ! Congruence formula: 1 + (n - 1) mod 9 for n > 0.
    integer(kind=8) function formula_root(n)
        integer(kind=8), intent(in) :: n

        if (n == 0) then
            formula_root = 0
        else
            formula_root = 1 + mod(n - 1, 9_8)
        end if
    end function formula_root

end program digital_root
