if {[regexp {(\d+)-(\d+)} "tel 555-1234" -> a b]} { puts "$a/$b" }
puts [regsub -all {\s+} "a   b  c" " "]
if {[catch {expr {1/0}} err]} { puts "error: $err" }
