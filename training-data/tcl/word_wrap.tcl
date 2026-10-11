proc wrap {text width} {
    set lines {}
    set line ""
    foreach w [split $text] {
        if {$w eq ""} continue
        if {$line eq ""} {
            set line $w
        } elseif {[string length $line] + 1 + [string length $w] <= $width} {
            append line " " $w
        } else {
            lappend lines $line
            set line $w
        }
    }
    if {$line ne ""} { lappend lines $line }
    return $lines
}

foreach l [wrap "the quick brown fox jumps over the lazy dog" 15] { puts $l }
