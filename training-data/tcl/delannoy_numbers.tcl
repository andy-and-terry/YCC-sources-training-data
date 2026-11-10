proc central_delannoy {n} {
    for {set i 0} {$i <= $n} {incr i} {
        for {set j 0} {$j <= $n} {incr j} {
            if {$i == 0 || $j == 0} {
                set g($i,$j) 1
            } else {
                set g($i,$j) [expr {$g([expr {$i-1}],$j) + $g($i,[expr {$j-1}]) + $g([expr {$i-1}],[expr {$j-1}])}]
            }
        }
    }
    return $g($n,$n)
}
set out {}
for {set n 0} {$n <= 5} {incr n} {lappend out [central_delannoy $n]}
puts [join $out " "] ;# 1 3 13 63 321 1683
