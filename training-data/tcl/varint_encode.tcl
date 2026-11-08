proc varint {n} {
    set out {}
    while {$n >= 128} {
        lappend out [expr {($n & 127) | 128}]
        set n [expr {$n >> 7}]
    }
    lappend out $n
}
puts [lmap b [varint 300] {format %02x $b}]
