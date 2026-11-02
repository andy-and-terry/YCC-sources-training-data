set d [dict create a 1 b 2 c 3]
dict for {k v} $d { puts "$k=$v" }
puts [dict get $d b]
