# regexp -indices returns {first last} character positions instead of text.
set text "key=value; name=Alice; id=42"

if {[regexp -indices {name=(\w+)} $text whole grp]} {
    lassign $whole ws we
    lassign $grp gs ge
    puts "whole match at $ws..$we"
    puts "group at $gs..$ge -> [string range $text $gs $ge]"
}

# Walk all matches using -start to continue after the previous match.
set pos 0
while {[regexp -indices -start $pos {(\w+)=(\w+)} $text m k v]} {
    lassign $m ms me
    puts "[string range $text {*}$k] -> [string range $text {*}$v]"
    set pos [expr {$me + 1}]
}

# Replace a matched range in place using the indices.
regexp -indices {id=(\d+)} $text -> idr
set text [string replace $text {*}$idr 99]
puts $text
