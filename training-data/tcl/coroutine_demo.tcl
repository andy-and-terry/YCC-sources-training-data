proc counter {} {
    set i 0
    while {1} {
        incr i
        yield $i
    }
}

coroutine countUp counter

puts [countUp]
puts [countUp]
puts [countUp]
