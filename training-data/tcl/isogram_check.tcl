proc isIsogram {s} {
    set seen {}
    foreach c [split [string tolower $s] ""] {
        if {![string is alpha $c]} continue
        if {$c in $seen} { return 0 }
        lappend seen $c
    }
    return 1
}

foreach w {lumberjacks background six-year-old programming} {
    puts "$w: [isIsogram $w]"
}
