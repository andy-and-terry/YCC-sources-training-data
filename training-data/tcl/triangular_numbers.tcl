set sum 0
set out {}
for {set n 1} {$n <= 10} {incr n} {
    incr sum $n
    lappend out $sum
}
puts $out
