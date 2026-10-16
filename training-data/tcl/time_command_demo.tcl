proc work {} {
    set s 0
    for {set i 0} {$i < 1000} {incr i} { incr s $i }
    return $s
}

set result [time work 50]
puts [regexp {^\d+(\.\d+)? microseconds per iteration$} $result]

set t0 [clock milliseconds]
work
set t1 [clock milliseconds]
puts [expr {$t1 >= $t0}]
