proc edit_distance {a b} {
    set m [string length $a]
    set n [string length $b]
    for {set i 0} {$i <= $m} {incr i} {
        set table($i,0) $i
    }
    for {set j 0} {$j <= $n} {incr j} {
        set table(0,$j) $j
    }
    for {set i 1} {$i <= $m} {incr i} {
        for {set j 1} {$j <= $n} {incr j} {
            if {[string index $a [expr {$i - 1}]] eq [string index $b [expr {$j - 1}]]} {
                set cost 0
            } else {
                set cost 1
            }
            set del [expr {$table([expr {$i - 1}],$j) + 1}]
            set ins [expr {$table($i,[expr {$j - 1}]) + 1}]
            set sub [expr {$table([expr {$i - 1}],[expr {$j - 1}]) + $cost}]
            set minVal $del
            if {$ins < $minVal} { set minVal $ins }
            if {$sub < $minVal} { set minVal $sub }
            set table($i,$j) $minVal
        }
    }
    return $table($m,$n)
}

puts [edit_distance "kitten" "sitting"]
