proc reverseBits {v} {
    set r 0
    for {set i 0} {$i < 8} {incr i} {
        set r [expr {($r << 1) | ($v & 1)}]
        set v [expr {$v >> 1}]
    }
    return $r
}

foreach v {1 6 13 128} { puts "$v [reverseBits $v]" } ;# 128 96 176 1
