set d [dict create name Ada age 36]
dict set d email ada@x.org
dict set d address city London
puts [dict get $d name]
puts [dict get $d address city]
puts [dict exists $d age]
puts [dict keys $d]
puts [dict size $d]
dict for {k v} $d { puts "$k -> $v" }
puts [dict get [dict merge $d {age 37}] age]
dict unset d email
puts [dict getdef $d zip none]
puts [dict map {k v} {a 1 b 2} {expr {$v * 10}}]
dict incr counts apple
dict incr counts apple 4
puts $counts
puts [dict filter {a 1 b 2 c 3} value {[12]}]
puts [dict values {x 1 y 2}]
dict with d { puts "name=$name" }
set copy $d
dict set copy name Bob
puts "[dict get $d name] [dict get $copy name]"
puts [lsort [dict keys [dict create z 1 a 2]]]
