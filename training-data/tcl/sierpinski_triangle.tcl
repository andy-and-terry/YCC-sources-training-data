set n 8
for {set r 0} {$r < $n} {incr r} {
    set line [string repeat " " [expr {$n - $r - 1}]]
    for {set c 0} {$c <= $r} {incr c} {
        append line [expr {($r & $c) == $c ? "* " : "  "}]
    }
    puts $line
}
