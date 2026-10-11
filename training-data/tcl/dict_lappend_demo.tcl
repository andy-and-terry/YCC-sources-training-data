set groups [dict create]
foreach word {apple avocado banana blueberry cherry apricot} {
    dict lappend groups [string index $word 0] $word
}

foreach letter [lsort [dict keys $groups]] {
    puts "$letter: [dict get $groups $letter]"
}

dict incr counts apple
dict incr counts apple 2
puts [dict get $counts apple]
