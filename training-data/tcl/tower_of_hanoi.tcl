proc hanoi {n from to via} {
    if {$n == 0} {
        return
    }
    hanoi [expr {$n - 1}] $from $via $to
    puts "Move disk $n from $from to $to"
    hanoi [expr {$n - 1}] $via $to $from
}

hanoi 3 A C B
