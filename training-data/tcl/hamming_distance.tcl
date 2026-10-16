proc hamming {a b} {
    if {[string length $a] != [string length $b]} {
        error "strings must have equal length"
    }
    set d 0
    foreach x [split $a ""] y [split $b ""] {
        if {$x ne $y} { incr d }
    }
    return $d
}

puts [hamming GAGCCTACTAACGGGAT CATCGTAATGACGGCCT]
puts [hamming abc abc]
puts [catch {hamming ab abc} msg]
puts $msg
