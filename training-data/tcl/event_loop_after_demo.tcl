set counter 0

proc tick {} {
    global counter
    incr counter
    puts "tick $counter"
    if {$counter < 3} {
        after 0 tick
    } else {
        set ::done 1
    }
}

after 0 tick
vwait ::done
