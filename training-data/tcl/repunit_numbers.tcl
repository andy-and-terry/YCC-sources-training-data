# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
set r 0
for {set n 1} {$n <= 8} {incr n} {
    set r [expr {$r * 10 + 1}]
    puts "$r[expr {$r % 3 == 0 ? {  (divisible by 3)} : {}}]"
}
