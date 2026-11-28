proc fletcher16 {s} {
    set s1 0; set s2 0
    foreach ch [split $s ""] {
        scan $ch %c b
        set s1 [expr {($s1 + $b) % 255}]
        set s2 [expr {($s2 + $s1) % 255}]
    }
    expr {($s2 << 8) | $s1}
}

puts [format %x [fletcher16 abcde]]
