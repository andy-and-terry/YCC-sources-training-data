proc invert {d} {
    set out {}
    dict for {k v} $d {
        dict lappend out $v $k
    }
    return $out
}

set colors {apple red cherry red banana yellow lime green}
puts [invert $colors]

set a {x 1 y 2}
set b {y 20 z 30}
puts [dict merge $a $b]

dict for {k v} [dict merge $a $b] {
    puts "$k=$v"
}
puts [dict size $a]
puts [dict keys $b]
puts [dict values $b]
puts [dict exists $a y]
dict unset a x
puts $a
