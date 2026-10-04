set a {5 3 9 3 1 5}
set b {3 4 5 6}

puts [lsort -integer $a]
puts [lsort -integer -unique $a]
puts [lsort -integer -decreasing $a]
puts [lsort -integer -indices $a]

proc intersect {x y} {
    set out {}
    foreach e $x {
        if {$e in $y && $e ni $out} {lappend out $e}
    }
    return $out
}
proc union {x y} {lsort -integer -unique [concat $x $y]}
proc difference {x y} {
    set out {}
    foreach e $x {
        if {$e ni $y && $e ni $out} {lappend out $e}
    }
    return $out
}
puts [lsort -integer [intersect $a $b]]
puts [union $a $b]
puts [lsort -integer [difference $a $b]]

puts [lsearch -all $a 3]
puts [lsearch -integer -sorted [lsort -integer $a] 9]
puts [lsort -nocase {banana Apple cherry}]
puts [lsort -dictionary {a10 a2 a1}]
puts [lsort -real {1.5 -2 0.25}]
puts [lsort -index 1 {{a 3} {b 1} {c 2}}]
puts [lsort -command {apply {{x y} {expr {[string length $x] - [string length $y]}}}} {ccc a bb}]

set seen [dict create]
foreach e $a {dict incr seen $e}
puts [dict get $seen 3]
puts [lsort -integer [dict keys $seen]]
puts [lsort -stride 2 -index 0 {b 2 a 1 c 3}]
