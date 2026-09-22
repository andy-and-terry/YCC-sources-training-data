set people [dict create \
    Ada  [dict create age 36 city "London"] \
    Bob  [dict create age 29 city "Paris"]]

dict for {name info} $people {
    puts "$name: [dict get $info age] years old, lives in [dict get $info city]"
}

dict set people Ada city "Berlin"
puts [dict get $people Ada city]

dict with people Bob {
    incr age
    puts "Bob is now $age"
}

dict update people Ada info {
    dict incr info age 1
    puts [dict get $info age]
}

set counts [dict create]
foreach word {apple pear apple lemon pear apple} {
    dict incr counts $word
}
dict for {word n} $counts {
    puts "$word -> $n"
}
