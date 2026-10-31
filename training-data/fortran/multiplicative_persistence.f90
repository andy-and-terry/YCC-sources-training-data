program multiplicative_persistence
    implicit none
    integer :: values(4) = [39, 77, 999, 10]
    integer :: i
    do i = 1, 4
        print '(I0, 1X, I0)', values(i), persistence(values(i))
    end do
contains
    integer function persistence(n)
        integer, intent(in) :: n
        integer :: m, product
        m = n
        persistence = 0
        do while (m >= 10)
            product = 1
            do while (m > 0)
                product = product * mod(m, 10)
                m = m / 10
            end do
            m = product
            persistence = persistence + 1
        end do
    end function persistence
end program multiplicative_persistence
