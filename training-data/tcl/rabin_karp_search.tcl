proc rabinKarpSearch {text pattern} {
    set n [string length $text]
    set m [string length $pattern]
    if {$m > $n} {
        return {}
    }

    set base 256
    set modulus 1000003
    set patternHash 0
    set windowHash 0
    set highOrder 1

    for {set i 0} {$i < $m - 1} {incr i} {
        set highOrder [expr {($highOrder * $base) % $modulus}]
    }

    for {set i 0} {$i < $m} {incr i} {
        set patternHash [expr {($patternHash * $base + [scan [string index $pattern $i] %c]) % $modulus}]
        set windowHash [expr {($windowHash * $base + [scan [string index $text $i] %c]) % $modulus}]
    }

    set matches {}
    for {set i 0} {$i <= $n - $m} {incr i} {
        if {$windowHash == $patternHash && [string range $text $i [expr {$i + $m - 1}]] eq $pattern} {
            lappend matches $i
        }
        if {$i < $n - $m} {
            set leading [scan [string index $text $i] %c]
            set trailing [scan [string index $text [expr {$i + $m}]] %c]
            set windowHash [expr {(($windowHash - $leading * $highOrder) * $base + $trailing) % $modulus}]
            if {$windowHash < 0} {
                incr windowHash $modulus
            }
        }
    }
    return $matches
}

puts [rabinKarpSearch "abracadabra" "abra"]
