# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
set out {}
for {set n 0} {$n < 10} {incr n} {
    lappend out [expr {$n * ($n + 1) / 2 + 1}]
}
puts [join $out " "]
