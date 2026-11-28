proc column_title {n} {
    set out ""
    while {$n > 0} {
        incr n -1
        set out [format %c [expr {65 + $n % 26}]]$out
        set n [expr {$n / 26}]
    }
    return $out
}

puts "[column_title 28] [column_title 701]" ;# AB ZY
