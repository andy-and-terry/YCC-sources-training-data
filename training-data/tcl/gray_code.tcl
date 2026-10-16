proc grayCode {n} {
    return [expr {$n ^ ($n >> 1)}]
}

proc fromGray {g} {
    set n 0
    while {$g} {
        set n [expr {$n ^ $g}]
        set g [expr {$g >> 1}]
    }
    return $n
}

for {set i 0} {$i < 8} {incr i} {
    set g [grayCode $i]
    puts "$i -> [format %03b $g] -> [fromGray $g]"
}
