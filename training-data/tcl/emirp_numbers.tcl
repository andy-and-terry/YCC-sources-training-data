proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} { return 0 }
    }
    return 1
}

set out {}
for {set p 2} {$p < 200} {incr p} {
    set r [scan [string reverse $p] %d]
    if {$r != $p && [isPrime $p] && [isPrime $r]} { lappend out $p }
}
puts $out ;# 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
