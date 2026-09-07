proc counter {} {
    set i 0
    while {1} {
        yield $i
        incr i
    }
}

coroutine countUp counter

puts [countUp]
puts [countUp]
puts [countUp]
