oo::class create OrderState {
    method next {order} {
        error "no transition"
    }
    method name {} {
        return "State"
    }
}

oo::class create NewState {
    superclass OrderState
    method name {} { return "New" }
    method next {order} {
        $order setState [PaidState new]
    }
}

oo::class create PaidState {
    superclass OrderState
    method name {} { return "Paid" }
    method next {order} {
        $order setState [ShippedState new]
    }
}

oo::class create ShippedState {
    superclass OrderState
    method name {} { return "Shipped" }
    method next {order} {
        puts "already shipped, no further transitions"
    }
}

oo::class create Order {
    variable state
    constructor {} {
        set state [NewState new]
    }
    method setState {s} {
        set state $s
    }
    method advance {} {
        $state next [self]
    }
    method status {} {
        return [$state name]
    }
}

set order [Order new]
puts [$order status]
$order advance
puts [$order status]
$order advance
puts [$order status]
$order advance
puts [$order status]
