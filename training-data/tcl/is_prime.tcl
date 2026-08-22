proc isPrime {n} {
    if {$n < 2} {
        return 0
    }
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} {
            return 0
        }
    }
    return 1
}

set primes {}
for {set n 2} {$n <= 20} {incr n} {
    if {[isPrime $n]} {
        lappend primes $n
    }
}
puts $primes
