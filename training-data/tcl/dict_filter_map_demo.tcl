set prices {apple 1.20 pear 0.80 melon 3.50 kiwi 0.60}

set cheap [dict filter $prices script {k v} {expr {$v < 1.0}}]
puts $cheap

set big [dict filter $prices key m*]
puts $big

puts [dict map {k v} $prices {expr {$v * 2}}]

dict for {k v} $prices {
    puts [format "%-6s %5.2f" $k $v]
}

puts [dict keys $prices]
puts [dict values $prices]
puts [dict size $prices]

set total 0.0
dict for {k v} $prices { set total [expr {$total + $v}] }
puts "total: $total"

puts [dict merge $prices {fig 2.00 apple 1.50}]
