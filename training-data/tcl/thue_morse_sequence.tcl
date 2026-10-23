# Thue-Morse: t(n) is the parity of the number of 1 bits in n
proc parity {n} {
    set p 0
    while {$n > 0} {
        set p [expr {$p ^ ($n & 1)}]
        set n [expr {$n >> 1}]
    }
    return $p
}

set out ""
for {set n 0} {$n < 32} {incr n} {
    append out [parity $n]
}
puts $out
