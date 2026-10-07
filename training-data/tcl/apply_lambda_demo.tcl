set square {x {expr {$x * $x}}}
puts [apply $square 7]

set add {{a b} {expr {$a + $b}}}
puts [apply $add 3 4]

proc makeMultiplier {factor} {
    return [list x [subst {expr {\$x * $factor}}]]
}

set triple [makeMultiplier 3]
puts [apply $triple 8]

proc mapApply {lambda values} {
    set result {}
    foreach v $values {
        lappend result [apply $lambda $v]
    }
    return $result
}

puts [mapApply {x {expr {$x * $x}}} {1 2 3 4 5}]

set nums {1 2 3 4 5 6 7 8 9 10}
set isEven {n {expr {$n % 2 == 0}}}
set evens [lmap n $nums {
    if {![apply $isEven $n]} continue
    set n
}]
puts $evens
