proc rot47 {s} {
    set out ""
    foreach ch [split $s ""] {
        scan $ch %c n
        if {$n >= 33 && $n <= 126} {
            set n [expr {33 + ($n - 33 + 47) % 94}]
        }
        append out [format %c $n]
    }
    return $out
}
set e [rot47 "Hello, World!"]
puts $e
puts [rot47 $e]
