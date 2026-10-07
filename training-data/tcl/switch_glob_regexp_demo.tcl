proc classify {s} {
    switch -glob -- $s {
        "*.tcl"   { return "tcl script" }
        "*.txt"   { return "text file" }
        "README*" { return "readme" }
        default   { return "unknown" }
    }
}
foreach f {main.tcl notes.txt README.md data.bin} {
    puts "$f: [classify $f]"
}

proc parse {s} {
    switch -regexp -matchvar m -- $s {
        {^(\d+)-(\d+)$}      { return "range [lindex $m 1] to [lindex $m 2]" }
        {^([a-z]+)@([a-z.]+)$} { return "email user=[lindex $m 1]" }
        {^\d+$}              { return "number" }
        default              { return "other" }
    }
}
foreach s {10-20 ann@example.com 42 ???} {
    puts "$s: [parse $s]"
}

proc day_type {d} {
    switch -exact -- $d {
        sat - sun { return weekend }
        mon - tue - wed - thu - fri { return weekday }
        default { error "bad day $d" }
    }
}
puts [day_type sat]
puts [day_type wed]
puts [catch {day_type xyz} msg]
puts $msg

set x 5
switch $x {
    1 { puts one }
    5 { puts five }
    default { puts other }
}
puts [switch -nocase -- HELLO {hello {string cat matched}}]
puts [switch -- nomatch {a {string cat A}}]
