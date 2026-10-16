set a 0b1100
set b 0b1010

puts "and: [expr {$a & $b}]"
puts "or:  [expr {$a | $b}]"
puts "xor: [expr {$a ^ $b}]"
puts "not: [expr {~$a}]"
puts "shl: [expr {$a << 2}]"
puts "shr: [expr {$a >> 2}]"

proc popcount {n} {
    set c 0
    while {$n} {
        set n [expr {$n & ($n - 1)}]
        incr c
    }
    return $c
}
puts [popcount 255]
puts [format %08b 37]
