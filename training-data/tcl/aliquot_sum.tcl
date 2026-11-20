# Aliquot sum classification.
proc aliquot {n} {
    set s 0
    for {set d 1} {$d < $n} {incr d} { if {$n % $d == 0} { incr s $d } }
    return $s
}
foreach n {6 12 15 28} {
    set a [aliquot $n]
    puts "$n $a [expr {$a == $n ? {perfect} : $a > $n ? {abundant} : {deficient}}]"
}
