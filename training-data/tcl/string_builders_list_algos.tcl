proc bubble {l} {
    set n [llength $l]
    for {set i 0} {$i < $n} {incr i} {
        for {set j 0} {$j < $n - $i - 1} {incr j} {
            if {[lindex $l $j] > [lindex $l [expr {$j + 1}]]} {
                set t [lindex $l $j]
                lset l $j [lindex $l [expr {$j + 1}]]
                lset l [expr {$j + 1}] $t
            }
        }
    }
    return $l
}
puts [bubble {5 2 9 1 5 6}]
proc bsearch {l t} {
    set lo 0; set hi [expr {[llength $l] - 1}]
    while {$lo <= $hi} {
        set mid [expr {($lo + $hi) / 2}]
        set v [lindex $l $mid]
        if {$v == $t} { return $mid } elseif {$v < $t} { set lo [expr {$mid + 1}] } else { set hi [expr {$mid - 1}] }
    }
    return -1
}
puts [bsearch {1 3 5 7 9} 7]
proc isprime n { if {$n < 2} {return 0}; for {set d 2} {$d * $d <= $n} {incr d} { if {$n % $d == 0} {return 0} }; return 1 }
puts [lmap n {2 3 4 5 6 7 8 9 10 11} {if {[isprime $n]} {set n} else {continue}}]
set sb ""
foreach w {alpha beta gamma} { append sb [string toupper [string index $w 0]][string range $w 1 end] " " }
puts [string trimright $sb]
puts [string map {a 4 e 3} "leet speak"]
puts [join [lmap c [split hello ""] {string toupper $c}] .]
