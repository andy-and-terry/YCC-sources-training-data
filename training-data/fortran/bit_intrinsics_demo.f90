program bit_intrinsics_demo
    implicit none
    integer :: v

    v = int(b'10110100')
    print '(a, b8.8)', 'value:      ', v
    print '(a, i0)', 'popcnt:     ', popcnt(v)
    print '(a, i0)', 'leadz:      ', leadz(v)
    print '(a, i0)', 'trailz:     ', trailz(v)
    print '(a, b8.8)', 'set bit 0:  ', ibset(v, 0)
    print '(a, b8.8)', 'clear bit 2:', ibclr(v, 2)
    print '(a, b8.8)', 'flip bit 7: ', ieor(v, ishft(1, 7))
    print '(a, l1)', 'bit 4 set:  ', btest(v, 4)
    print '(a, b8.8)', 'and 0F:     ', iand(v, int(z'0F'))
    print '(a, b8.8)', 'shift left: ', iand(ishft(v, 1), 255)
    print '(a, i0)', 'not:        ', not(v)
end program bit_intrinsics_demo
