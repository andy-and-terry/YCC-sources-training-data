proc check {kind value} {
    set ok [string is $kind -strict $value]
    puts [format "%-8s %-10s %s" $kind "'$value'" [expr {$ok ? "yes" : "no"}]]
}

check integer 42
check integer 4.2
check double 4.2
check double abc
check alpha hello
check alpha h3llo
check alnum abc123
check digit 007
check space "   "
check boolean true
check boolean maybe
check upper ABC
check xdigit ff09
check integer ""
