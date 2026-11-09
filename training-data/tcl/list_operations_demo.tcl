set l {c a b}
puts [lsort $l]
puts [lindex $l 1]
lappend l d
puts [llength $l]
puts [lrange $l 1 2]
puts [lsearch $l b]
puts [join $l ,]
