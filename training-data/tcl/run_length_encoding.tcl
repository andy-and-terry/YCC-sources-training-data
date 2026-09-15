proc rle_encode {s} {
    set result ""
    set n [string length $s]
    if {$n == 0} {
        return $result
    }
    set current [string index $s 0]
    set count 1
    for {set i 1} {$i < $n} {incr i} {
        set ch [string index $s $i]
        if {$ch eq $current} {
            incr count
        } else {
            append result "$current$count"
            set current $ch
            set count 1
        }
    }
    append result "$current$count"
    return $result
}

proc rle_decode {s} {
    set result ""
    set n [string length $s]
    set i 0
    while {$i < $n} {
        set ch [string index $s $i]
        incr i
        set digits ""
        while {$i < $n && [string is digit [string index $s $i]]} {
            append digits [string index $s $i]
            incr i
        }
        for {set j 0} {$j < $digits} {incr j} {
            append result $ch
        }
    }
    return $result
}

set encoded [rle_encode "aaabbbcccca"]
puts $encoded
puts [rle_decode $encoded]
