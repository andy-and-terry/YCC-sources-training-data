proc wordBreak {s dict} {
    set n [string length $s]
    set dp [lrepeat [expr {$n + 1}] 0]
    lset dp 0 1

    for {set i 1} {$i <= $n} {incr i} {
        for {set j 0} {$j < $i} {incr j} {
            if {[lindex $dp $j] && [lindex $dp $i] == 0} {
                set word [string range $s $j [expr {$i - 1}]]
                if {$word in $dict} {
                    lset dp $i 1
                }
            }
        }
    }
    return [lindex $dp $n]
}

set dictionary {tcl is fun lang}

puts [wordBreak "tclisfun" $dictionary]
puts [wordBreak "tcllang" $dictionary]
puts [wordBreak "nope" $dictionary]
