set numbers {1 2 3 4 5}
set squares [lmap n $numbers {expr {$n * $n}}]
puts $squares

set evens [lmap n $numbers {
    if {$n % 2 != 0} continue
    set n
}]
puts $evens

lassign {Ada 30 engineer} name age role
puts "$name is $age and works as $role"

lassign [split "192.168.0.1" "."] a b c d
puts "$a-$b-$c-$d"
