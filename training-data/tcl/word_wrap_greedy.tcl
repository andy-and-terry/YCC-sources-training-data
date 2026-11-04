proc wrap {text width} {
    set lines {}
    set line ""
    foreach word [split [string trim $text]] {
        if {$line ne "" && [string length $line] + 1 + [string length $word] > $width} {
            lappend lines $line
            set line $word
        } else {
            set line [expr {$line eq "" ? $word : "$line $word"}]
        }
    }
    if {$line ne ""} { lappend lines $line }
    return $lines
}

foreach l [wrap "the quick brown fox jumps over the lazy dog" 15] { puts [format "|%-15s|" $l] }
