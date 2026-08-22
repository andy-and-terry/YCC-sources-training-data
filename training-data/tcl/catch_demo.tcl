proc safeDivide {a b} {
    if {$b == 0} {
        error "division by zero"
    }
    return [expr {$a / $b}]
}

if {[catch {safeDivide 10 2} result]} {
    puts "error: $result"
} else {
    puts $result
}

if {[catch {safeDivide 5 0} result]} {
    puts "error: $result"
} else {
    puts $result
}
