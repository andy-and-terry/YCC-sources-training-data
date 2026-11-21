# Amicable pairs below 1500 via sums of proper divisors.
proc s {n} {
    set t 0
    for {set d 1} {$d < $n} {incr d} {
        if {$n % $d == 0} { incr t $d }
    }
    return $t
}

for {set a 2} {$a < 1500} {incr a} {
    set b [s $a]
    if {$b > $a && [s $b] == $a} { puts "$a $b" }
}
