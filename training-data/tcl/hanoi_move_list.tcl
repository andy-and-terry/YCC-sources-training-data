proc hanoi {n a b c} {
    if {$n == 0} {return {}}
    concat [hanoi [expr {$n-1}] $a $c $b] [list "$a->$c"] [hanoi [expr {$n-1}] $b $a $c]
}
set moves [hanoi 3 A B C]
puts "[llength $moves]: $moves"
