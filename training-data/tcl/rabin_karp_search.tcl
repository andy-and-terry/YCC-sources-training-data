proc rabin_karp_search {text pattern} {
    set n [string length $text]
    set m [string length $pattern]
    if {$m == 0 || $m > $n} {
        return -1
    }

    set base 256
    set prime 101

    set h 1
    for {set k 0} {$k < $m - 1} {incr k} {
        set h [expr {($h * $base) % $prime}]
    }

    set patternHash 0
    set windowHash 0
    for {set k 0} {$k < $m} {incr k} {
        scan [string index $pattern $k] %c patCode
        scan [string index $text $k] %c textCode
        set patternHash [expr {($patternHash * $base + $patCode) % $prime}]
        set windowHash [expr {($windowHash * $base + $textCode) % $prime}]
    }

    for {set i 0} {$i <= $n - $m} {incr i} {
        if {$windowHash == $patternHash && [string range $text $i [expr {$i + $m - 1}]] eq $pattern} {
            return $i
        }
        if {$i < $n - $m} {
            scan [string index $text $i] %c oldCode
            scan [string index $text [expr {$i + $m}]] %c newCode
            set windowHash [expr {($base * ($windowHash - $oldCode * $h) + $newCode) % $prime}]
            if {$windowHash < 0} {
                incr windowHash $prime
            }
        }
    }
    return -1
}

puts [rabin_karp_search "abxabcabcaby" "abcaby"]
puts [rabin_karp_search "hello world" "xyz"]
