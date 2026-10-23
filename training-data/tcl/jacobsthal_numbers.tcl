# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
set a 0
set b 1
set out {}
for {set i 0} {$i < 15} {incr i} {
    lappend out $a
    lassign [list $b [expr {$b + 2 * $a}]] a b
}
puts [join $out " "]
