foreach {name age} {ann 31 bob 25 cy 40} {
    puts "$name is $age"
}

foreach a {1 2 3} b {x y z} {
    puts "$a$b"
}

foreach a {1 2 3 4} b {x y} {
    puts "a=$a b=[expr {$b eq "" ? "(none)" : $b}]"
}

set total 0
foreach n {5 10 15} {
    incr total $n
}
puts "total $total"

foreach {k v} [list x 1 y 2] {
    dict set d $k $v
}
puts $d

foreach {key value} $d {
    puts "$key => $value"
}

foreach word [split "the quick brown fox" " "] {
    lappend lens [string length $word]
}
puts $lens

set i 0
foreach item {a b c} {
    puts "[incr i]: $item"
}

foreach {first second} {1 2 3} {
    puts "pair: $first / [expr {[info exists second] ? $second : "?"}]"
}
puts [lmap x {1 2 3 4} {expr {$x * $x}}]
puts [lmap x {1 2 3 4 5} {if {$x % 2} {set x} else continue}]
