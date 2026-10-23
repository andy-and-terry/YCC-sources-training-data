# Woodall numbers: W(n) = n * 2^n - 1
set result {}
for {set n 1} {$n <= 10} {incr n} {
    lappend result [expr {$n * (1 << $n) - 1}]
}
puts [join $result " "]
