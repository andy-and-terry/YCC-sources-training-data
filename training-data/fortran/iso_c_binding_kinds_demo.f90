module c_math
    use, intrinsic :: iso_c_binding, only: c_double, c_int
    implicit none
contains
    ! Callable from C as: int add_ints(int a, int b)
    function add_ints(a, b) result(r) bind(C, name="add_ints")
        integer(c_int), value :: a, b
        integer(c_int) :: r
        r = a + b
    end function add_ints

    function scale(x, k) result(r) bind(C, name="scale")
        real(c_double), value :: x
        integer(c_int), value :: k
        real(c_double) :: r
        r = x * real(k, c_double)
    end function scale
end module c_math

program iso_c_binding_kinds_demo
    use, intrinsic :: iso_c_binding
    use c_math
    implicit none

    print *, 'c_int bytes: ', storage_size(1_c_int) / 8
    print *, 'c_double bytes: ', storage_size(1.0_c_double) / 8
    print *, add_ints(2_c_int, 3_c_int)
    print *, scale(1.5_c_double, 4_c_int)
    print *, 'null pointer: ', .not. c_associated(c_null_ptr)
end program iso_c_binding_kinds_demo
