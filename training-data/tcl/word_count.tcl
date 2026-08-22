set text "the quick brown fox jumps over the lazy dog the fox runs"
array set counts {}

foreach word [split $text] {
    if {[info exists counts($word)]} {
        incr counts($word)
    } else {
        set counts($word) 1
    }
}

foreach word [lsort -integer -decreasing -indices [array names counts]] {
    puts "$word: $counts($word)"
}
