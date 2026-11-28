proc isAutomorphic {n} {
    set sq [expr {$n * $n}]
    return [string equal [string range $sq end-[expr {[string length $n] - 1}] end] $n]
}

set out {}
for {set n 0} {$n < 1000} {incr n} {
    if {[isAutomorphic $n]} { lappend out $n }
}
puts $out ;# 0 1 5 6 25 76 376 625
