proc swap_case {s} {
    set out ""
    foreach c [split $s ""] {
        if {[string is upper $c]} {append out [string tolower $c]} else {append out [string toupper $c]}
    }
    return $out
}

puts [swap_case "Hello World 42"]
