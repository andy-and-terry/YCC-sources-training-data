proc repeat {n body} {
    for {set i 0} {$i < $n} {incr i} {
        uplevel 1 $body
    }
}

proc unless {cond body} {
    if {![uplevel 1 [list expr $cond]]} {
        uplevel 1 $body
    }
}

set count 0
repeat 3 {incr count 2}
puts "count = $count"

unless {$count > 10} {puts "count is not above 10"}
