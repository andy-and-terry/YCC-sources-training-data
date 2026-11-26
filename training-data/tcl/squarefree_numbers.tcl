# Squarefree numbers up to 100; expect 61.
proc squarefree {n} {
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % ($d * $d) == 0} { return 0 }
    }
    return 1
}
set c 0
for {set n 1} {$n <= 100} {incr n} { incr c [squarefree $n] }
puts $c
