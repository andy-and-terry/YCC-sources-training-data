proc equilibrium_index {nums} {
    set total [tcl::mathop::+ {*}$nums]
    set left 0
    set i 0
    foreach v $nums {
        if {$left == $total - $left - $v} { return $i }
        incr left $v
        incr i
    }
    return -1
}

puts [equilibrium_index {1 7 3 6 5 6}] ;# 3
