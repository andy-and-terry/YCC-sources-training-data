set scores {alice 90 bob 55 carol 72 dave 40}

puts [dict filter $scores value {[4-9][0-9]}]
puts [dict filter $scores script {k v} {expr {$v >= 70}}]
puts [dict filter $scores key {[ab]*}]

dict update scores alice a bob b {
    incr a 5
    set b 100
}
puts $scores

dict with scores {
    puts "carol has $carol"
}

puts [dict map {k v} $scores {expr {$v * 2}}]
dict incr scores dave 10
puts [dict get $scores dave]
puts [dict merge {a 1 b 2} {b 20 c 30}]
