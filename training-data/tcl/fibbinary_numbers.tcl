# Fibbinary numbers: no two adjacent 1 bits.
set out {}
for {set n 0} {$n < 50} {incr n} {
    if {($n & ($n >> 1)) == 0} { lappend out $n }
}
puts [join $out " "]
