namespace eval stack {
    variable items {}
    proc push {x} { variable items; lappend items $x }
    proc pop {} { variable items; set v [lindex $items end]; set items [lrange $items 0 end-1]; return $v }
    namespace export push pop
    namespace ensemble create
}
stack push 1
stack push 2
puts [stack pop]
