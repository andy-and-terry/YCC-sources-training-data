proc bwt {s} {
    set n [string length $s]
    set rots {}
    for {set i 0} {$i < $n} {incr i} {
        lappend rots "[string range $s $i end][string range $s 0 [expr {$i - 1}]]"
    }
    set out ""
    foreach r [lsort $rots] { append out [string index $r end] }
    return $out
}
puts [bwt {banana$}]
