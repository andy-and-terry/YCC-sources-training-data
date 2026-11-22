# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
proc is_practical {n} {
    set reach 1   ;# bit i set <=> i is a subset sum
    for {set d 1} {$d <= $n} {incr d} {
        if {$n % $d == 0} { set reach [expr {$reach | ($reach << $d)}] }
    }
    set mask [expr {(1 << ($n + 1)) - 1}]
    return [expr {($reach & $mask) == $mask}]
}
set out {}
for {set n 1} {$n <= 40} {incr n} {
    if {[is_practical $n]} { lappend out $n }
}
puts [join $out " "]
