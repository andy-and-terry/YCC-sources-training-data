program implied_do_constructor_demo
    implicit none
    integer, parameter :: n = 8
    integer :: squares(n), evens(n/2), i, j
    real :: x(5)
    character(len=1) :: letters(5)
    integer :: tri(10)

    squares = [(i * i, i = 1, n)]
    evens = [(2 * i, i = 1, n / 2)]
    x = [(real(i) / 4.0, i = 0, 4)]
    letters = [(achar(96 + i), i = 1, 5)]
    tri = [((j * 10 + i, i = 1, j), j = 1, 4)]

    print *, squares
    print *, evens
    print *, x
    print *, letters
    print *, tri
    print *, [integer :: ]
    print *, [real :: 1, 2.5, 3]
    print '(5(I3, :, ","))', (i, i = 10, 50, 10)
end program implied_do_constructor_demo
