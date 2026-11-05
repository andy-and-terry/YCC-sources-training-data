proc incr_by {varName {by 1}} {
    upvar 1 $varName v
    incr v $by
}
set n 10
incr_by n
incr_by n 5
puts $n
