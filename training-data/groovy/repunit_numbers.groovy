// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
long r = 0
(1..8).each {
    r = r * 10 + 1
    println "$r" + (r % 3 == 0 ? '  (divisible by 3)' : '')
}
