proc plainCoffeeCost {} {
    return 2.0
}

proc plainCoffeeDescription {} {
    return "coffee"
}

proc withMilk {costProc descProc} {
    return [list [list $costProc "+0.5"] [list $descProc "+milk"]]
}

proc decoratedCost {base extras} {
    set total $base
    foreach extra $extras {
        set total [expr {$total + $extra}]
    }
    return $total
}

proc decoratedDescription {base extras} {
    set desc $base
    foreach extra $extras {
        append desc ", $extra"
    }
    return $desc
}

set baseCost [plainCoffeeCost]
set baseDesc [plainCoffeeDescription]
set extraCosts {0.5 0.25}
set extraDescs {milk sugar}

puts "[decoratedDescription $baseDesc $extraDescs]: \$[decoratedCost $baseCost $extraCosts]"
