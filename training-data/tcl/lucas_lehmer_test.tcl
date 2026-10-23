proc is_prime {n} {
    if {$n < 2} {
        return 0
    }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} {
            return 0
        }
    }
    return 1
}

proc lucas_lehmer {p} {
    if {$p == 2} {
        return 1
    }
    set m [expr {(1 << $p) - 1}]
    set s 4
    for {set i 0} {$i < $p - 2} {incr i} {
        set s [expr {($s * $s - 2) % $m}]
    }
    return [expr {$s == 0}]
}

set result {}
for {set p 2} {$p <= 19} {incr p} {
    if {[is_prime $p] && [lucas_lehmer $p]} {
        lappend result $p
    }
}
puts [join $result " "]
