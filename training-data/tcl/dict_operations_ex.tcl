set d [dict create a 1 b 2]
dict set d c 3
dict for {k v} $d { puts "$k=$v" }
puts [dict get $d b]
puts [dict exists $d z]
puts [dict keys $d]
dict incr d a 10
puts [dict get $d a]
