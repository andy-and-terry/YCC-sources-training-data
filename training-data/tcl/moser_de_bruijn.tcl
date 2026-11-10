# Read the binary digits of i as base-4 digits.
proc moser {i} {
    set value 0
    set power 1
    while {$i > 0} {
        if {$i & 1} {incr value $power}
        set power [expr {$power * 4}]
        set i [expr {$i >> 1}]
    }
    return $value
}
set out {}
for {set i 0} {$i < 10} {incr i} {lappend out [moser $i]}
puts [join $out " "] ;# 0 1 4 5 16 17 20 21 64 65
