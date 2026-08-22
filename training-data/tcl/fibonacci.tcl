proc fibonacci {n} {
    set result {}
    set a 0
    set b 1
    for {set i 0} {$i < $n} {incr i} {
        lappend result $a
        set temp [expr {$a + $b}]
        set a $b
        set b $temp
    }
    return $result
}

puts [fibonacci 11]
