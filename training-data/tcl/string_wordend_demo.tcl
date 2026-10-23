set text "Hello, brave new world"

set i 0
while {$i < [string length $text]} {
    set e [string wordend $text $i]
    set start [string wordstart $text $i]
    puts "'[string range $text $start [expr {$e - 1}]]' at $start..$e"
    set i $e
}
