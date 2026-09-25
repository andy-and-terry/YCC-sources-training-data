set memo [dict create]

proc fib_memo {n} {
    global memo
    if {[dict exists $memo $n]} {
        return [dict get $memo $n]
    }
    if {$n <= 1} {
        set result $n
    } else {
        set result [expr {[fib_memo [expr {$n - 1}]] + [fib_memo [expr {$n - 2}]]}]
    }
    dict set memo $n $result
    return $result
}

puts [fib_memo 10]
puts [fib_memo 20]
puts [dict size $memo]
