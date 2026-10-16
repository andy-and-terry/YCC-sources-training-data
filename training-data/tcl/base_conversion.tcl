proc toBase {n base} {
    if {$n == 0} { return 0 }
    set digits 0123456789abcdefghijklmnopqrstuvwxyz
    set out ""
    while {$n > 0} {
        set out [string index $digits [expr {$n % $base}]]$out
        set n [expr {$n / $base}]
    }
    return $out
}

proc fromBase {s base} {
    set n 0
    foreach c [split $s ""] {
        set n [expr {$n * $base + [string first $c 0123456789abcdefghijklmnopqrstuvwxyz]}]
    }
    return $n
}

puts [toBase 255 2]
puts [toBase 255 16]
puts [fromBase ff 16]
puts [fromBase 777 8]
puts [format %x 255]
