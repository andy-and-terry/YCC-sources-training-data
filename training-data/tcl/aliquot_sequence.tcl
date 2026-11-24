# Aliquot sequence: replace n by the sum of its proper divisors.
proc aliquot_sum {n} {
    set s 0
    for {set d 1} {$d <= $n / 2} {incr d} {
        if {$n % $d == 0} { incr s $d }
    }
    return $s
}

set seq {12}
while {[lindex $seq end] > 1 && [llength $seq] < 20} {
    lappend seq [aliquot_sum [lindex $seq end]]
}
puts [join $seq " "]
