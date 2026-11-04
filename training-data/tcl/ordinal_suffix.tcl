proc ordinal {n} {
    set r100 [expr {$n % 100}]
    if {$r100 >= 11 && $r100 <= 13} { return ${n}th }
    switch [expr {$n % 10}] {
        1 { return ${n}st }
        2 { return ${n}nd }
        3 { return ${n}rd }
        default { return ${n}th }
    }
}

set out {}
foreach n {1 2 3 4 11 12 13 21 101 111} { lappend out [ordinal $n] }
puts [join $out " "]
