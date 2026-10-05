program merge_pack_demo
    implicit none
    integer :: v(8) = [4, -1, 7, 0, -5, 3, 8, -2]
    integer, allocatable :: positives(:)

    print *, 'abs via merge:', merge(v, -v, v >= 0)
    print *, 'sign labels:  ', merge(1, 0, v > 0)

    positives = pack(v, v > 0)
    print *, 'positives:', positives
    print *, 'count:', count(v < 0), 'any zero:', any(v == 0), 'all small:', all(abs(v) < 10)

    print *, 'unpacked:', unpack(positives, v > 0, 0)
    print *, 'cshift:', cshift(v, 2)
    print *, 'eoshift:', eoshift(v, -2, boundary=99)
    print *, 'minval/maxval:', minval(v), maxval(v)
    print *, 'findloc of 7:', findloc(v, 7, dim=1)
end program merge_pack_demo
