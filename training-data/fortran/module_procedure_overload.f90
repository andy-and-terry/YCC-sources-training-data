module overload_mod
    implicit none
    interface add
        module procedure add_int
        module procedure add_real
    end interface add
contains
    function add_int(a, b) result(res)
        integer, intent(in) :: a, b
        integer :: res
        res = a + b
    end function add_int

    function add_real(a, b) result(res)
        real, intent(in) :: a, b
        real :: res
        res = a + b
    end function add_real
end module overload_mod

program main
    use overload_mod
    implicit none
    print *, add(2, 3)
    print *, add(2.5, 3.5)
end program main
