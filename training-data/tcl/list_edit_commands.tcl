set l {a b c d e}

puts [lrange $l 1 3]
puts [lreplace $l 1 2 X Y Z]
puts [lreplace $l 0 0]
puts [linsert $l 2 NEW]
puts [lreverse $l]
puts [lrepeat 3 ab]
puts [lindex $l end-1]
puts [lsearch -exact $l c]

lset l 0 FIRST
puts $l

set nested {{1 2} {3 4}}
lset nested 1 0 99
puts $nested
puts [lindex $nested 1 0]
puts [concat $l {f g}]
puts [join [lsort -unique {b a b c a}] ,]
