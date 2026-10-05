proc rotate_left {lst k} {
    set n [llength $lst]
    if {$n == 0} { return $lst }
    set k [expr {$k % $n}]
    return [concat [lrange $lst $k end] [lrange $lst 0 [expr {$k - 1}]]]
}

proc rotate_right {lst k} {
    rotate_left $lst [expr {-$k}]
}

puts [rotate_left {1 2 3 4 5} 2]
puts [rotate_right {1 2 3 4 5} 2]
puts [rotate_left {1 2 3} 7]
