set nums {5 -3 8 -1 9 2}
puts [lsort -integer $nums]
puts [lsort -integer -decreasing $nums]

set words {banana Apple cherry apple}
puts [lsort -nocase $words]

proc by_age {a b} {
    return [expr {[lindex $a 1] - [lindex $b 1]}]
}

set people {{Bob 29} {Ada 36} {Cleo 22}}
puts [lsort -command by_age $people]

set records {{Ada 36} {Bob 29} {Cleo 22}}
puts [lsort -integer -index 1 $records]
