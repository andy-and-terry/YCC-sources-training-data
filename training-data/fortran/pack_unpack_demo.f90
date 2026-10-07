program pack_unpack_demo
    implicit none
    integer :: v(8) = [4, -1, 7, 0, -3, 9, 2, -8]
    logical :: mask(8)
    integer, allocatable :: pos(:)
    integer :: k

    mask = v > 0
    pos = pack(v, mask)
    print *, "positives:", pos
    print *, "count:", count(mask), " any neg:", any(v < 0), " all < 10:", all(v < 10)
    print *, "unpack:", unpack([10, 20, 30, 40], mask, -99)
    print *, "indices:", pack([(k, k = 1, 8)], mask)
    print *, "maxloc:", maxloc(v), " minloc:", minloc(v)
    print *, "cumulative:", [(sum(v(1:k)), k = 1, 8)]
end program pack_unpack_demo
