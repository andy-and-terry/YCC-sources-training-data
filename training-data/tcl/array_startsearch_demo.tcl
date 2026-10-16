array set colors {red #f00 green #0f0 blue #00f}

set id [array startsearch colors]
set found {}
while {[array anymore colors $id]} {
    lappend found [array nextelement colors $id]
}
array donesearch colors $id

puts [lsort $found]
puts [array names colors -glob {*e*}]
