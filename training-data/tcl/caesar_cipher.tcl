proc shiftChar {c shift} {
    scan $c %c code
    if {$code >= 97 && $code <= 122} {
        return [format %c [expr {($code - 97 + $shift) % 26 + 97}]]
    }
    if {$code >= 65 && $code <= 90} {
        return [format %c [expr {($code - 65 + $shift) % 26 + 65}]]
    }
    return $c
}

proc caesar {text shift} {
    set out ""
    foreach c [split $text ""] {
        append out [shiftChar $c $shift]
    }
    return $out
}

set enc [caesar "Hello, World!" 3]
puts $enc
puts [caesar $enc -3]
