array set ages {alice 30 bob 25 carol 41}

puts [lsort [array names ages]]
puts [array size ages]
puts [info exists ages(bob)]
puts [info exists ages(dave)]

foreach {name age} [array get ages] {
    set copy($name) [expr {$age + 1}]
}
foreach name [lsort [array names copy]] {
    puts "$name -> $copy($name)"
}

unset ages(bob)
puts [lsort [array names ages]]
