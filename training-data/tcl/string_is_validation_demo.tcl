proc check {type value} {
    set ok [string is $type -strict $value]
    puts [format "%-8s %-10s %s" $type "'$value'" [expr {$ok ? "yes" : "no"}]]
}

check integer 42
check integer 4.2
check integer ""
check double 3.14
check double abc
check alpha hello
check alpha hello1
check alnum abc123
check digit 12345
check upper ABC
check lower abc
check space "   "
check boolean true
check boolean maybe
check xdigit ff00
check ascii abc
check list {a b {c d}}

proc safe_int {s default} {
    if {[string is integer -strict $s]} {
        return $s
    }
    return $default
}
puts [safe_int 17 0]
puts [safe_int abc -1]

proc valid_email {s} {
    regexp {^[[:alnum:]._-]+@[[:alnum:].-]+\.[a-z]{2,}$} $s
}
puts [valid_email ann@example.com]
puts [valid_email bad@@x]

puts [string is integer -failindex idx "12x4"]
puts $idx
puts [string is true -strict yes]
puts [string is wideinteger 9223372036854775807]
