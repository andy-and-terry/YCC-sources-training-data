set d [dict create a 1 b 2]
dict for {k v} $d { puts "$k=$v" }
dict set d c 3
puts [dict get $d c]
puts [dict exists $d z]
