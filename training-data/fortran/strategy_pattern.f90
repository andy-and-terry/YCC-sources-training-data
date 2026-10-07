module strategy_pattern_mod
    implicit none

    abstract interface
        integer function discount_strategy(price)
            integer, intent(in) :: price
        end function discount_strategy
    end interface
contains
    integer function no_discount(price) result(final_price)
        integer, intent(in) :: price
        final_price = price
    end function no_discount

    integer function ten_percent_off(price) result(final_price)
        integer, intent(in) :: price
        final_price = price - price / 10
    end function ten_percent_off

    integer function half_off(price) result(final_price)
        integer, intent(in) :: price
        final_price = price / 2
    end function half_off

    integer function checkout(price, strategy) result(total)
        integer, intent(in) :: price
        procedure(discount_strategy), pointer :: strategy
        total = strategy(price)
    end function checkout
end module strategy_pattern_mod

program main
    use strategy_pattern_mod
    implicit none
    procedure(discount_strategy), pointer :: chosen

    chosen => no_discount
    print *, checkout(200, chosen)

    chosen => ten_percent_off
    print *, checkout(200, chosen)

    chosen => half_off
    print *, checkout(200, chosen)
end program main
