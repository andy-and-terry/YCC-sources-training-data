# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
proc is_hamming {n} {
    foreach p {2 3 5} {
        while {$n % $p == 0} {
            set n [expr {$n / $p}]
        }
    }
    return [expr {$n == 1}]
}

set found {}
for {set n 1} {[llength $found] < 20} {incr n} {
    if {[is_hamming $n]} {
        lappend found $n
    }
}
puts $found
