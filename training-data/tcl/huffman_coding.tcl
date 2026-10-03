proc buildFrequencies {text} {
    array set freq {}
    foreach c [split $text {}] {
        if {[info exists freq($c)]} {
            incr freq($c)
        } else {
            set freq($c) 1
        }
    }
    return [array get freq]
}

proc buildCodes {text} {
    array set freq [buildFrequencies $text]
    set nodes {}
    foreach {char count} [array get freq] {
        lappend nodes [list $count [list leaf $char]]
    }

    while {[llength $nodes] > 1} {
        set nodes [lsort -integer -index 0 $nodes]
        set a [lindex $nodes 0]
        set b [lindex $nodes 1]
        set nodes [lrange $nodes 2 end]
        set merged [list [expr {[lindex $a 0] + [lindex $b 0]}] [list node $a $b]]
        lappend nodes $merged
    }

    array set codes {}
    proc walk {node prefix} {
        upvar codes codes
        set kind [lindex $node 0]
        if {$kind == "leaf"} {
            set codes([lindex $node 1]) $prefix
        } else {
            walk [lindex $node 1] "${prefix}0"
            walk [lindex $node 2] "${prefix}1"
        }
    }
    walk [lindex [lindex $nodes 0] 1] ""
    return [array get codes]
}

array set codeTable [buildCodes "abracadabra"]
foreach {char code} [array get codeTable] {
    puts "$char -> $code"
}
