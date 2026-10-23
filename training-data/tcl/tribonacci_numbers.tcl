# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
proc tribonacci {count} {
    set a 0; set b 0; set c 1
    set result {}
    for {set i 0} {$i < $count} {incr i} {
        lappend result $a
        lassign [list $b $c [expr {$a + $b + $c}]] a b c
    }
    return $result
}

puts "Tribonacci: [join [tribonacci 15] {, }]"
