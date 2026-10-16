proc luhn {number} {
    set digits [lreverse [split [string map {" " ""} $number] ""]]
    set sum 0
    set i 0
    foreach d $digits {
        if {$i % 2 == 1} {
            set d [expr {$d * 2}]
            if {$d > 9} { incr d -9 }
        }
        incr sum $d
        incr i
    }
    return [expr {$sum % 10 == 0}]
}

puts [luhn "4539 1488 0343 6467"]
puts [luhn "8273 1232 7352 0569"]
