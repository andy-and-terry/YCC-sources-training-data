proc pieces {cuts} {expr {($cuts * $cuts + $cuts + 2) / 2}}
set out {}
for {set n 0} {$n < 10} {incr n} {lappend out [pieces $n]}
puts [join $out " "] ;# 1 2 4 7 11 16 22 29 37 46
