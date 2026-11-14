proc incr_by {varName {n 1}} {
    upvar 1 $varName v
    incr v $n
}
set x 5
incr_by x
incr_by x 10
puts $x
