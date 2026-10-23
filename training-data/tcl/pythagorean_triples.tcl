proc triples {limit} {
    set out {}
    for {set a 1} {$a < $limit} {incr a} {
        for {set b $a} {$b < $limit} {incr b} {
            set c [expr {int(sqrt($a*$a + $b*$b))}]
            if {$c <= $limit && $c*$c == $a*$a + $b*$b} {
                lappend out [list $a $b $c]
            }
        }
    }
    return $out
}

foreach t [triples 20] {
    lassign $t a b c
    puts "$a $b $c"
}
