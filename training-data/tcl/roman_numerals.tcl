proc to_roman {n} {
    set values {1000 900 500 400 100 90 50 40 10 9 5 4 1}
    set symbols {M CM D CD C XC L XL X IX V IV I}
    set result ""
    set remaining $n
    for {set i 0} {$i < [llength $values]} {incr i} {
        set v [lindex $values $i]
        while {$remaining >= $v} {
            append result [lindex $symbols $i]
            set remaining [expr {$remaining - $v}]
        }
    }
    return $result
}

puts [to_roman 1994]
