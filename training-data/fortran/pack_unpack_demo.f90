program pack_unpack_demo
    implicit none
    integer :: a(8) = [3, -1, 4, -1, 5, -9, 2, 6]
    integer :: positives(4)
    logical :: mask(8)
    integer :: restored(8)

    mask = a > 0
    positives = pack(a, mask)
    print *, 'positives:', positives
    print *, 'count    :', count(mask)
    print *, 'negatives:', pack(a, .not. mask)

    restored = unpack(positives * 10, mask, vector=a)
    print *, 'unpacked :', restored

    print *, 'first positive at', findloc(mask, .true., dim=1)
    print *, 'any > 5  :', any(a > 5)
    print *, 'all > -10:', all(a > -10)
    print *, 'maxloc   :', maxloc(a)
    print *, 'sum pos  :', sum(a, mask=mask)
end program pack_unpack_demo
