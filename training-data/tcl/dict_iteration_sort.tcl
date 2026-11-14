set d [dict create b 2 a 1 c 3]
foreach k [lsort [dict keys $d]] { puts "$k=[dict get $d $k]" }
dict for {k v} $d { if {$v > 1} { puts "big: $k" } }
