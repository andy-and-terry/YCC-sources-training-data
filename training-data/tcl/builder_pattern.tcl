proc newBurgerBuilder {} {
    return [dict create bun "plain" patty "none" toppings {}]
}

proc withBun {builder bun} {
    dict set builder bun $bun
    return $builder
}

proc withPatty {builder patty} {
    dict set builder patty $patty
    return $builder
}

proc addTopping {builder topping} {
    dict lappend builder toppings $topping
    return $builder
}

proc describeBurger {builder} {
    set toppings [join [dict get $builder toppings] ", "]
    return "[dict get $builder bun] bun, [dict get $builder patty] patty, toppings: $toppings"
}

set burger [newBurgerBuilder]
set burger [withBun $burger "sesame"]
set burger [withPatty $burger "veggie"]
set burger [addTopping $burger "lettuce"]
set burger [addTopping $burger "tomato"]

puts [describeBurger $burger]
