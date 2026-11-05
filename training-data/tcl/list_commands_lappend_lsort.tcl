set xs {}
foreach n {5 3 9 1} { lappend xs $n }
puts [lsort -integer $xs]
puts [lsearch $xs 9]
puts [lrange $xs 1 2]
puts [llength $xs]
puts [join $xs ,]
