proc center {text width} {
    set len [string length $text]
    if {$len >= $width} {
        return $text
    }
    set left [expr {($width - $len) / 2}]
    set right [expr {$width - $len - $left}]
    return "[string repeat { } $left]$text[string repeat { } $right]"
}

foreach s {tcl center centered} {
    puts "|[center $s 12]|"
}
puts [format "|%-12s|%12s|" left right]
