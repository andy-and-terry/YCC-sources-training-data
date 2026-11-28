proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} { return 0 }
    }
    return 1
}

set out {}
for {set n 2} {$n < 200} {incr n} {
    if {$n eq [string reverse $n] && [isPrime $n]} { lappend out $n }
}
puts $out ;# 2 3 5 7 11 101 131 151 181 191
