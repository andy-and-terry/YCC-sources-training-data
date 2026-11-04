proc interleave {args} {
    set longest 0
    foreach p $args { set longest [expr {max($longest, [string length $p])}] }
    set out ""
    for {set i 0} {$i < $longest} {incr i} {
        foreach p $args { append out [string index $p $i] }
    }
    return $out
}

puts [interleave abc 12345]
puts [interleave ab cd efg]
