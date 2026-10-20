proc incr_in {varName} { upvar 1 $varName v; incr v }
set n 4
incr_in n
set d [dict create a 1 b 2]
dict for {k v} $d { puts "$k=$v" }
puts $n
