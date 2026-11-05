set d [dict create a 1 b 2 c 3]
dict for {k v} $d { puts "$k=$v" }
dict set d d 4
puts [dict get $d b]
puts [dict exists $d z]
puts [dict size $d]
