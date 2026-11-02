namespace eval counter {
    variable n 0
    proc incr_ {} { variable n; return [incr n] }
}
counter::incr_
puts [counter::incr_]
