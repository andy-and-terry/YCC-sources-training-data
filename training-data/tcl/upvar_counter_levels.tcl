proc incrBy {varName amount} {
    upvar 1 $varName v
    set v [expr {$v + $amount}]
}

proc outer {} {
    set total 5
    incrBy total 10
    inner
    return $total
}

proc inner {} {
    upvar 1 total t
    set t [expr {$t * 2}]
}

puts [outer]

set x 1
incrBy x 41
puts $x
