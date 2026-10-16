program pointer_array_target_demo
    implicit none
    integer, target :: data(6) = [10, 20, 30, 40, 50, 60]
    integer, pointer :: whole(:), evens(:), p

    whole => data
    evens => data(2::2)
    p => data(4)

    print *, whole
    print *, evens
    evens = evens + 1
    p = -p
    print *, data
    print *, associated(p), associated(evens, data(2::2))
    nullify (p)
    print *, associated(p)
end program pointer_array_target_demo
