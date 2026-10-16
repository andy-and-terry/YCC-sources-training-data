proc sum {lst} {
    set total 0
    foreach x $lst { set total [expr {$total + $x}] }
    return $total
}

proc product {lst} {
    set p 1
    foreach x $lst { set p [expr {$p * $x}] }
    return $p
}

set data {2 3 4 5}
puts "sum = [sum $data]"
puts "product = [product $data]"
puts "mean = [expr {double([sum $data]) / [llength $data]}]"
