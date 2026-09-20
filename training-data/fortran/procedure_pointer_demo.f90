module strategy_mod
    implicit none
    abstract interface
        function op_interface(a, b) result(res)
            integer, intent(in) :: a, b
            integer :: res
        end function op_interface
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

    function apply_strategy(a, b, strategy) result(res)
        integer, intent(in) :: a, b
        procedure(op_interface), pointer, intent(in) :: strategy
        integer :: res
        res = strategy(a, b)
    end function apply_strategy
end module strategy_mod

program main
    use strategy_mod
    implicit none
    procedure(op_interface), pointer :: op

    op => add_op
    print *, apply_strategy(3, 4, op)

    op => mul_op
    print *, apply_strategy(3, 4, op)
end program main
