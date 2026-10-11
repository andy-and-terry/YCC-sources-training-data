proc isPangram {s} {
    set seen [dict create]
    foreach c [split [string tolower $s] ""] {
        if {[string is alpha -strict $c]} {
            dict set seen $c 1
        }
    }
    return [expr {[dict size $seen] == 26}]
}

puts [isPangram "The quick brown fox jumps over the lazy dog"]
puts [isPangram "Hello world"]
