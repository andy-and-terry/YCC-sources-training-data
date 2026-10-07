proc expandAroundCenter {s left right} {
    set n [string length $s]
    while {$left >= 0 && $right < $n && [string index $s $left] eq [string index $s $right]} {
        incr left -1
        incr right
    }
    return [string range $s [expr {$left + 1}] [expr {$right - 1}]]
}

proc longestPalindrome {s} {
    set best ""
    for {set i 0} {$i < [string length $s]} {incr i} {
        set odd [expandAroundCenter $s $i $i]
        if {[string length $odd] > [string length $best]} { set best $odd }
        set even [expandAroundCenter $s $i [expr {$i + 1}]]
        if {[string length $even] > [string length $best]} { set best $even }
    }
    return $best
}

puts [longestPalindrome "babad"]
puts [longestPalindrome "cbbd"]
