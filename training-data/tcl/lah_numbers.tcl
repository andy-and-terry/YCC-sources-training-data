proc lah {n k} {
    set c 1; set f 1
    for {set i 0} {$i < $k - 1} {incr i} {
        set c [expr {$c * ($n - 1 - $i) / ($i + 1)}]
    }
    for {set i [expr {$k + 1}]} {$i <= $n} {incr i} {
        set f [expr {$f * $i}]
    }
    expr {$c * $f}
}

for {set n 1} {$n <= 5} {incr n} {
    set row {}
    for {set k 1} {$k <= $n} {incr k} {lappend row [lah $n $k]}
    puts $row
}
