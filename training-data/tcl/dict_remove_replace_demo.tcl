set d [dict create a 1 b 2 c 3 d 4]

set without [dict remove $d b d]
puts $without

set replaced [dict replace $d a 10 e 5]
puts $replaced

# originals are unchanged: dict values are immutable
puts [dict size $d]
