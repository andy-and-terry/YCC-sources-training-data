proc affine {text a b} {
    set out ""
    foreach ch [split $text ""] {
        scan $ch %c code
        if {$code >= 65 && $code <= 90} {
            set code [expr {65 + ($a * ($code - 65) + $b) % 26}]
        }
        append out [format %c $code]
    }
    return $out
}
puts [affine AFFINE 5 8]
