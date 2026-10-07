set balance 100
set history {}

proc logChange {varName args} {
    global history
    upvar #0 $varName value
    lappend history "$varName -> $value"
}

trace add variable balance write logChange

set balance 150
incr balance -20

foreach entry $history {
    puts $entry
}

proc guardPositive {varName args} {
    upvar #0 $varName value
    if {$value < 0} {
        set value 0
    }
}

trace add variable balance write guardPositive
incr balance -1000
puts $balance

trace remove variable balance write logChange
trace remove variable balance write guardPositive
