array set stock {apple 5 banana 0 cherry 12}

puts [array size stock]
puts [array exists stock]
puts [info exists stock(apple)]
puts [info exists stock(durian)]

array unset stock b*
puts [lsort [array names stock]]

unset stock(apple)
puts [lsort [array names stock]]

array unset stock
puts [array exists stock]
