proc is_self_describing {s} {
    set i 0
    foreach d [split $s ""] {
        set count [llength [lsearch -all [split $s ""] $i]]
        if {$count != $d} { return 0 }
        incr i
    }
    return 1
}

foreach s {1210 2020 21200 1211} {
    puts "$s [is_self_describing $s]"
}
