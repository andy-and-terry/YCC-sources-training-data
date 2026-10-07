program merge_pack_demo
    implicit none
    integer :: v(8), i
    logical :: mask(8)

    v = [(i - 4, i = 1, 8)]
    mask = v > 0

    print '(A, *(I0, 1X))', "values:    ", v
    print '(A, *(I0, 1X))', "abs via merge: ", merge(v, -v, mask)
    print '(A, *(I0, 1X))', "positives: ", pack(v, mask)
    print '(A, I0)', "count: ", count(mask)
    print '(A, *(I0, 1X))', "unpack:    ", unpack([7, 8, 9], [.true., .false., .true., .false.], 0)
    print '(A, L1, 1X, L1)', "any/all: ", any(mask), all(mask)
end program merge_pack_demo
