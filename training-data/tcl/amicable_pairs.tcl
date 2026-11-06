# Amicable pairs: d(a) == b and d(b) == a with a != b.
proc d {n} {
    set s 0
    for {set i 1} {$i < $n} {incr i} {
        if {$n % $i == 0} { incr s $i }
    }
    return $s
}

for {set a 2} {$a < 1500} {incr a} {
    set b [d $a]
    if {$b > $a && [d $b] == $a} { puts "$a $b" }
}
