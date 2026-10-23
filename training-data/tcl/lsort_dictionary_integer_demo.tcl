set names {item10 Item2 item1 Item20}
puts [lsort $names]
puts [lsort -dictionary $names]
puts [lsort -nocase $names]

set nums {10 9 100 1}
puts [lsort $nums]
puts [lsort -integer $nums]
puts [lsort -integer -decreasing $nums]

set pairs {{b 2} {a 3} {c 1}}
puts [lsort -index 1 -integer $pairs]
puts [lsort -index 0 $pairs]
