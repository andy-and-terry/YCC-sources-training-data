# Reverse-and-add until a palindrome; count the steps.
proc rev {n} {
    return [string reverse $n]
}

proc steps {n} {
    for {set count 0} {$count < 50} {incr count} {
        if {$count > 0 && $n == [rev $n]} { return $count }
        set n [expr {$n + [rev $n]}]
    }
    return -1
}

set out {}
foreach n {56 57 59 79 89} { lappend out [steps $n] }
puts [join $out " "]
