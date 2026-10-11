program index_scan_verify_demo
    implicit none
    character(len=*), parameter :: s = 'the cat sat on the mat'

    print *, index(s, 'the')
    print *, index(s, 'the', back=.true.)
    print *, index(s, 'dog')
    print *, scan(s, 'xyz aeiou')
    print *, verify('12345', '0123456789')
    print *, verify('123a5', '0123456789')
end program index_scan_verify_demo
