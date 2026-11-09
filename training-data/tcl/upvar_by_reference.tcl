proc incr_by {varName n} {
    upvar 1 $varName v
    incr v $n
}
set x 10
incr_by x 5
puts $x
