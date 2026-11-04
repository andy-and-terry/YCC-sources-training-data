proc to_base {n base} {
    set digits 0123456789abcdefghijklmnopqrstuvwxyz
    if {$n == 0} { return 0 }
    set out ""
    while {$n > 0} {
        set out [string index $digits [expr {$n % $base}]]$out
        set n [expr {$n / $base}]
    }
    return $out
}

foreach b {2 8 16 36} { puts "255 in base $b = [to_base 255 $b]" }
puts [scan ff %x]
