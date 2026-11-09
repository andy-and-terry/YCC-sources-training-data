proc greet {name {greeting "Hello"}} {
    return "$greeting, $name!"
}
puts [greet World]
puts [greet Tcl Hi]
proc sum {args} {
    set t 0
    foreach a $args { incr t $a }
    return $t
}
puts [sum 1 2 3 4]
