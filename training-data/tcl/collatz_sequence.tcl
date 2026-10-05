proc collatz {n} {
    set seq [list $n]
    while {$n != 1} {
        if {$n % 2 == 0} {
            set n [expr {$n / 2}]
        } else {
            set n [expr {3 * $n + 1}]
        }
        lappend seq $n
    }
    return $seq
}

set s [collatz 27]
puts "steps: [expr {[llength $s] - 1}]"
puts "peak: [tcl::mathfunc::max {*}$s]"
puts [collatz 6]
