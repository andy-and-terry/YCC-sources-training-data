for {set i 0} {$i < 10} {incr i} {
    if {$i == 2} continue
    if {$i == 6} break
    puts "i=$i"
}

set n 0
while {1} {
    incr n
    if {$n % 2} continue
    puts "even $n"
    if {$n >= 6} break
}

set found ""
foreach row {{1 2 3} {4 5 6} {7 8 9}} {
    foreach v $row {
        if {$v == 5} {
            set found $v
            break
        }
    }
    if {$found ne ""} break
}
puts "found $found"

set count 0
for {set a 1} {$a <= 3} {incr a} {
    for {set b 1} {$b <= 3} {incr b} {
        if {$a == $b} continue
        incr count
    }
}
puts "off-diagonal pairs: $count"

set k 10
while {$k > 0} {
    set k [expr {$k - 3}]
}
puts "k=$k"

set result [catch {
    foreach x {1 2 3} {
        if {$x == 2} {error "stopped at $x"}
    }
} msg]
puts "$result: $msg"
