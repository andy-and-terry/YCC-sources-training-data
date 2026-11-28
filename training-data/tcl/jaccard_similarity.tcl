proc jaccard {a b} {
    foreach x $a { set sa($x) 1; set u($x) 1 }
    set inter 0
    foreach x $b {
        if {[info exists sa($x)] && ![info exists seen($x)]} { incr inter }
        set seen($x) 1
        set u($x) 1
    }
    set union [array size u]
    if {$union == 0} { return 1.0 }
    return [expr {double($inter) / $union}]
}
puts [jaccard {1 2 3 4} {3 4 5}]
