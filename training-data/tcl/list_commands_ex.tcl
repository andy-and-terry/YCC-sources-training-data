set l {5 3 9 1}
puts [lsort -integer $l]
puts [lindex $l end]
puts [lrange $l 1 2]
lappend l 7
puts [llength $l]
puts [lsearch $l 9]
puts [join [lreverse $l] ,]
puts [lmap x $l {expr {$x * 2}}]
