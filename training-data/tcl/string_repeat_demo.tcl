puts [string repeat "ab" 3]
puts [string repeat "-" 20]

proc triangle {n} {
    for {set i 1} {$i <= $n} {incr i} {
        puts "[string repeat { } [expr {$n - $i}]][string repeat * [expr {2 * $i - 1}]]"
    }
}
triangle 4
