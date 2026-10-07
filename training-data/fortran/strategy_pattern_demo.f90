module strategy_mod
    implicit none

    abstract interface
        function discount_strategy(price) result(final_price)
            real, intent(in) :: price
            real :: final_price
        end function discount_strategy
    end interface

    type :: price_context
        procedure(discount_strategy), pointer, nopass :: calculate => null()
    contains
        procedure :: apply => context_apply
    end type price_context

contains
    function no_discount(price) result(final_price)
        real, intent(in) :: price
        real :: final_price
        final_price = price
    end function no_discount

    function student_discount(price) result(final_price)
        real, intent(in) :: price
        real :: final_price
        final_price = price * 0.90
    end function student_discount

    function senior_discount(price) result(final_price)
        real, intent(in) :: price
        real :: final_price
        final_price = price * 0.85
    end function senior_discount

    function context_apply(this, price) result(final_price)
        class(price_context), intent(in) :: this
        real, intent(in) :: price
        real :: final_price
        final_price = this%calculate(price)
    end function context_apply
end module strategy_mod

program main
    use strategy_mod
    implicit none
    type(price_context) :: ctx
    real :: price

    price = 100.0

    ctx%calculate => no_discount
    print *, ctx%apply(price)

    ctx%calculate => student_discount
    print *, ctx%apply(price)

    ctx%calculate => senior_discount
    print *, ctx%apply(price)
end program main
