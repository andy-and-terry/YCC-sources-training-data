# Wilson's theorem primality test.
proc wilson {n} {
    if {$n < 2} { return 0 }
    set f 1
    for {set i 2} {$i < $n} {incr i} { set f [expr {$f * $i % $n}] }
    expr {$f == $n - 1}
}
set out {}
for {set n 2} {$n < 20} {incr n} { if {[wilson $n]} { lappend out $n } }
puts $out
