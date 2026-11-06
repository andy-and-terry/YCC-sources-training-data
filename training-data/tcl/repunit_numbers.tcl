# Repunits: numbers made only of the digit 1.
set r 0
set out {}
for {set i 0} {$i < 5} {incr i} {
    set r [expr {$r * 10 + 1}]
    lappend out $r
}
puts $out
