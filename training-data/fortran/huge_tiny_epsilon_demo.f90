program huge_tiny_epsilon_demo
    implicit none
    real :: r
    double precision :: d
    integer :: i

    print *, 'huge(int):  ', huge(i)
    print *, 'huge(real): ', huge(r)
    print *, 'tiny(real): ', tiny(r)
    print *, 'eps(real):  ', epsilon(r)
    print *, 'eps(dbl):   ', epsilon(d)
    print *, 'digits(real): ', digits(r)
    print *, 'precision(dbl): ', precision(d)
    print *, 'nearly equal: ', abs((0.1d0 + 0.2d0) - 0.3d0) < 10 * epsilon(d)
end program huge_tiny_epsilon_demo
