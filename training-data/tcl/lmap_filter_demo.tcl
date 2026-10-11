set nums {1 2 3 4 5 6 7 8 9 10}

puts [lmap n $nums { expr {$n * $n} }]

set evens [lmap n $nums {
    if {$n % 2} continue
    set n
}]
puts $evens

puts [lmap a {1 2 3} b {x y z} { list $a$b }]
puts [lmap w {apple fig banana} { string length $w }]
