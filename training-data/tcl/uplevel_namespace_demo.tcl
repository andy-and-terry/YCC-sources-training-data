namespace eval Counter {
    variable count 0

    proc increment {} {
        variable count
        incr count
        return $count
    }
}

puts [Counter::increment]
puts [Counter::increment]
