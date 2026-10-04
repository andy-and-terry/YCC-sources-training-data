set fruits {apple banana cherry}
lappend fruits date
puts [llength $fruits]
puts [lindex $fruits 1]
puts [lindex $fruits end]
puts [lrange $fruits 1 2]
puts [linsert $fruits 1 apricot]
puts [lreplace $fruits 0 0 avocado]
puts [lsort -decreasing $fruits]
puts [lsearch $fruits cherry]
puts [lreverse $fruits]
puts [join $fruits ", "]
puts [split "a,b,,c" ,]
puts [concat {1 2} {3 4}]
puts [lrepeat 3 x]
puts [lsort -integer {10 9 100 1}]
lset fruits 0 apple_pie
puts $fruits
puts [lindex {{a b} {c d}} 1 0]
