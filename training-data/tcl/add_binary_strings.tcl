proc add_binary {a b} {
    set i [expr {[string length $a] - 1}]
    set j [expr {[string length $b] - 1}]
    set carry 0
    set out ""
    while {$i >= 0 || $j >= 0 || $carry} {
        set sum $carry
        if {$i >= 0} { incr sum [string index $a $i]; incr i -1 }
        if {$j >= 0} { incr sum [string index $b $j]; incr j -1 }
        set out [expr {$sum % 2}]$out
        set carry [expr {$sum / 2}]
    }
    return $out
}

puts [add_binary 1010 1011] ;# 10101
