function newton_sqrt(x) result(res)
    real, intent(in) :: x
    real :: res, guess
    integer :: i
    guess = x / 2.0
    do i = 1, 20
        guess = 0.5 * (guess + x / guess)
    end do
    res = guess
end function newton_sqrt

program main
    implicit none
    real :: newton_sqrt
    print *, newton_sqrt(2.0)
    print *, newton_sqrt(25.0)
end program main
