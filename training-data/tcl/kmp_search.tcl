proc build_lps {pattern} {
    set n [string length $pattern]
    for {set i 0} {$i < $n} {incr i} {
        set lps($i) 0
    }
    set len 0
    set i 1
    while {$i < $n} {
        if {[string index $pattern $i] eq [string index $pattern $len]} {
            incr len
            set lps($i) $len
            incr i
        } elseif {$len != 0} {
            set len $lps([expr {$len - 1}])
        } else {
            set lps($i) 0
            incr i
        }
    }
    set result {}
    for {set j 0} {$j < $n} {incr j} {
        lappend result $lps($j)
    }
    return $result
}

proc kmp_search {text pattern} {
    set lps [build_lps $pattern]
    set n [string length $text]
    set m [string length $pattern]
    set i 0
    set j 0
    while {$i < $n} {
        if {[string index $text $i] eq [string index $pattern $j]} {
            incr i
            incr j
            if {$j == $m} {
                return [expr {$i - $j}]
            }
        } elseif {$j > 0} {
            set j [lindex $lps [expr {$j - 1}]]
        } else {
            incr i
        }
    }
    return -1
}

puts [kmp_search "abxabcabcaby" "abcaby"]
