proc zArray {s} {
    set n [string length $s]
    set z [lrepeat $n 0]
    set left 0
    set right 0
    for {set i 1} {$i < $n} {incr i} {
        if {$i < $right} {
            set copyVal [lindex $z [expr {$i - $left}]]
            lset z $i [expr {min($copyVal, $right - $i)}]
        }
        while {[expr {$i + [lindex $z $i]}] < $n && [string index $s [lindex $z $i]] eq [string index $s [expr {$i + [lindex $z $i]}]]} {
            lset z $i [expr {[lindex $z $i] + 1}]
        }
        if {[expr {$i + [lindex $z $i]}] > $right} {
            set left $i
            set right [expr {$i + [lindex $z $i]}]
        }
    }
    return $z
}

proc min {a b} { return [expr {$a < $b ? $a : $b}] }

proc zSearch {pattern text} {
    set combined "${pattern}\x01${text}"
    set z [zArray $combined]
    set plen [string length $pattern]
    set matches {}
    for {set i 0} {$i < [llength $z]} {incr i} {
        if {[lindex $z $i] == $plen} {
            lappend matches [expr {$i - $plen - 1}]
        }
    }
    return $matches
}

puts [zSearch "aba" "abababa"]
