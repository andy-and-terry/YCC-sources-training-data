proc classify {value} {
    switch -glob -- $value {
        {[0-9]*} { return "starts with digit" }
        {*.tcl}  { return "tcl script" }
        {a?c}    { return "a-?-c pattern" }
        default  { return "other" }
    }
}

foreach v {42abc script.tcl abc hello} {
    puts "$v -> [classify $v]"
}

# -regexp with captured variables
switch -regexp -matchvar m -- "2024-05-17" {
    {^(\d+)-(\d+)-(\d+)$} { puts "year [lindex $m 1], month [lindex $m 2]" }
}

# Fall-through with "-"
foreach day {sat sun mon} {
    switch $day {
        sat -
        sun { puts "$day: weekend" }
        default { puts "$day: weekday" }
    }
}
