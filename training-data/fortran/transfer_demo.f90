program transfer_demo
    implicit none
    integer :: i
    real :: r
    integer :: bits(2)

    r = 1.0
    i = transfer(r, i)
    print '(a, z8.8)', 'bits of 1.0: ', i

    bits = transfer(2.5d0, bits)
    print *, size(bits), 'integers hold one double'
    print *, transfer(bits, 1.0d0)
    print *, transfer('A', 1) /= 0
end program transfer_demo
