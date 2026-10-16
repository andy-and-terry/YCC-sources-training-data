set counter 0

proc bump {} {
    global counter
    incr counter
}

proc noAccess {} {
    if {[info exists counter]} {
        return "sees counter"
    }
    return "no counter in local scope"
}

bump
bump
puts $counter
puts [noAccess]

proc viaNamespace {} {
    return $::counter
}
puts [viaNamespace]
