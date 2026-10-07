program array_intrinsics_demo
    implicit none
    integer :: arr(6) = [1, 2, 3, 4, 5, 6]
    integer :: zeros(6) = 0
    integer :: evens(3)
    integer :: merged(6)
    integer :: spread_arr(3, 2)
    logical :: mask(6)

    mask = mod(arr, 2) == 0
    evens = pack(arr, mask)
    print *, evens

    merged = merge(arr, zeros, mask)
    print *, merged

    spread_arr = spread([10, 20, 30], dim=2, ncopies=2)
    print *, spread_arr(:, 1)
    print *, spread_arr(:, 2)

    print *, count(mask)
    print *, any(arr > 5)
    print *, all(arr > 0)
end program array_intrinsics_demo
