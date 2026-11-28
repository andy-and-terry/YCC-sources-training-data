proc is_prime {n} {
    if {$n < 2} {return 0}
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} {return 0}
    }
    return 1
}

proc rev {n} { string reverse $n }

set out {}
for {set p 2} {$p < 100} {incr p} {
    set r [rev $p]
    if {$r != $p && [is_prime $p] && [is_prime $r]} {lappend out $p}
}
puts $out
