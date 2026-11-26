# Deficient numbers below 100; expect 76.
proc properSum {n} {
    set t 0
    for {set d 1} {$d < $n} {incr d} {
        if {$n % $d == 0} { incr t $d }
    }
    return $t
}
set c 0
for {set n 1} {$n < 100} {incr n} { if {[properSum $n] < $n} { incr c } }
puts $c
