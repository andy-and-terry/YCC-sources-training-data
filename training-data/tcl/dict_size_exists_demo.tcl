set d [dict create a 1 b 2 c 3]

puts [dict size $d]
puts [dict exists $d b]
puts [dict exists $d z]
puts [dict keys $d]
puts [dict values $d]

dict unset d b
puts $d
puts [dict get $d a]
puts [dict getdef $d missing fallback]
puts [dict exists {x {y {z 1}}} x y z]
