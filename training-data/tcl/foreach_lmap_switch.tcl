foreach x {1 2 3} {
    switch $x {
        1 { puts one }
        2 - 3 { puts "two or three" }
    }
}
puts [lmap v {1 2 3} {expr {$v * $v}}]
