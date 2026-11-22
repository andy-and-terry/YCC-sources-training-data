# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
proc fact {n} {
    set f 1
    for {set i 2} {$i <= $n} {incr i} { set f [expr {$f * $i}] }
    return $f
}
proc comb {n k} { expr {[fact $n] / ([fact $k] * [fact [expr {$n - $k}]])} }

set n 5
set out {}
for {set k 1} {$k <= $n} {incr k} {
    lappend out [expr {[comb [expr {$n - 1}] [expr {$k - 1}]] * [fact $n] / [fact $k]}]
}
puts [join $out " "]
