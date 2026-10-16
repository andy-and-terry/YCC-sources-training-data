proc sumTo {n {acc 0}} {
    if {$n == 0} { return $acc }
    tailcall sumTo [expr {$n - 1}] [expr {$acc + $n}]
}

puts [sumTo 10]
puts [sumTo 100000]

proc isEven {n} { if {$n == 0} { return 1 }; tailcall isOdd [expr {$n - 1}] }
proc isOdd {n} { if {$n == 0} { return 0 }; tailcall isEven [expr {$n - 1}] }
puts [isEven 10001]
