proc reverseString {s} {
    set out ""
    for {set i [expr {[string length $s] - 1}]} {$i >= 0} {incr i -1} {
        append out [string index $s $i]
    }
    return $out
}

puts [reverseString "hello world"]
puts [reverseString ""]
puts [string reverse "builtin"]
