proc crc8 {s} {
    set crc 0
    foreach ch [split $s ""] {
        scan $ch %c n
        set crc [expr {$crc ^ $n}]
        for {set i 0} {$i < 8} {incr i} {
            if {$crc & 0x80} {
                set crc [expr {(($crc << 1) ^ 0x07) & 0xFF}]
            } else {
                set crc [expr {($crc << 1) & 0xFF}]
            }
        }
    }
    return $crc
}
puts [format %02x [crc8 123456789]]
