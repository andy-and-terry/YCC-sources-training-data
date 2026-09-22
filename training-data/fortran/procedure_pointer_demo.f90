module operations_mod
    implicit none
    abstract interface
        function binop_interface(a, b) result(res)
            integer, intent(in) :: a, b
            integer :: res
        end function binop_interface
    end interface
contains
    function add_op(a, b) result(res)
        integer, intent(in) :: a, b
        integer :: res
        res = a + b
    end function add_op

    function mul_op(a, b) result(res)
        integer, intent(in) :: a, b
        integer :: res
        res = a * b
    end function mul_op
end module operations_mod

program procedure_pointer_demo
    use operations_mod
    implicit none
    procedure(binop_interface), pointer :: op => null()

    op => add_op
    print *, op(3, 4)

    op => mul_op
    print *, op(3, 4)
end program procedure_pointer_demo
