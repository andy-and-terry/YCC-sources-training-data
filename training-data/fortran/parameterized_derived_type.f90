program parameterized_derived_type
    implicit none
    type :: buffer(n)
        integer, len :: n
        integer :: data(n)
    end type buffer

    type(buffer(4)) :: b4
    type(buffer(2)) :: b2

    b4%data = [1, 2, 3, 4]
    b2%data = [9, 8]
    print *, b4%n, sum(b4%data)
    print *, b2%n, sum(b2%data)
end program parameterized_derived_type
