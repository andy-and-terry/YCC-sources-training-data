set scores [dict create Ada 88 Bob 72 Cleo 95]

foreach {name score} $scores {
    puts "$name: $score"
}

puts [dict get $scores Ada]
puts [dict exists $scores Zed]
