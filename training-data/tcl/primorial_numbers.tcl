# Primorials up to 1e6, including 1; expect 8.
proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}

set values {1}
set acc 1
for {set p 2} {1} {incr p} {
    if {![isPrime $p]} continue
    set acc [expr {$acc * $p}]
    if {$acc > 1000000} break
    lappend values $acc
}
puts "[llength $values]: $values"
