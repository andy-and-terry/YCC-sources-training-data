proc is_palindrome {s} {
    set normalized ""
    foreach c [split [string tolower $s] ""] {
        if {[regexp {[a-z0-9]} $c]} {
            append normalized $c
        }
    }
    set reversed [string reverse $normalized]
    return [expr {$normalized eq $reversed}]
}

puts [is_palindrome "A man, a plan, a canal: Panama"]
puts [is_palindrome "hello"]
