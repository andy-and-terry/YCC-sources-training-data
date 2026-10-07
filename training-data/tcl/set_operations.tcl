set a {1 2 3 4 5}
set b {3 4 5 6 7}

proc list_union {a b} {
    return [lsort -unique [concat $a $b]]
}

proc list_intersection {a b} {
    set result {}
    foreach x $a {
        if {[lsearch $b $x] != -1} {
            lappend result $x
        }
    }
    return [lsort -unique $result]
}

proc list_difference {a b} {
    set result {}
    foreach x $a {
        if {[lsearch $b $x] == -1} {
            lappend result $x
        }
    }
    return [lsort -unique $result]
}

puts [list_union $a $b]
puts [list_intersection $a $b]
puts [list_difference $a $b]
