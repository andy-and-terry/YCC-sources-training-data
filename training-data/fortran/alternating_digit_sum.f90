program alternating_digit_sum
    implicit none
    integer :: values(3) = [1234, 99999, 1000]
    integer :: i
    do i = 1, 3
        print '(I0, 1X, I0)', values(i), ads(values(i))
    end do
contains
    integer function ads(n)
        integer, intent(in) :: n
        integer :: m, sign
        m = n
        sign = 1
        ads = 0
        do while (m > 0)
            ads = ads + sign * mod(m, 10)
            sign = -sign
            m = m / 10
        end do
    end function ads
end program alternating_digit_sum
