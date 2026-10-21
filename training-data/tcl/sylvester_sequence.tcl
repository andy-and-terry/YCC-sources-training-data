# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1 (Tcl integers are arbitrary precision)
set s 2
for {set i 0} {$i < 8} {incr i} {
    puts "s($i) = $s"
    set s [expr {$s * $s - $s + 1}]
}
