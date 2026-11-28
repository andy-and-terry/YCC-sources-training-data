proc isPronic {x} {
    set n [expr {int(sqrt($x))}]
    return [expr {$n * ($n + 1) == $x}]
}

set out {}
for {set n 0} {$n < 10} {incr n} { lappend out [expr {$n * ($n + 1)}] }
puts $out ;# 0 2 6 12 20 30 42 56 72 90
puts "[isPronic 56] [isPronic 57]" ;# 1 0
