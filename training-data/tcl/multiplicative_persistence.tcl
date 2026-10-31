proc persistence {n} {
    set steps 0
    while {$n >= 10} {
        set product 1
        foreach d [split $n ""] {
            set product [expr {$product * $d}]
        }
        set n $product
        incr steps
    }
    return $steps
}

foreach n {39 77 999 10} {
    puts "$n [persistence $n]"
}
