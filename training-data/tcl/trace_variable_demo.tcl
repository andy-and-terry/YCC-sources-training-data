set balance 100
set history {}

proc log_change {varName args} {
    global $varName history
    lappend history "$varName changed to [set $varName]"
}

trace add variable balance write log_change

set balance 150
set balance 80

foreach entry $history {
    puts $entry
}

trace remove variable balance write log_change
set balance 999
puts [llength $history]
