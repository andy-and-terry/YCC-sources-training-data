if {[regexp {(\d+)-(\d+)} "tel 555-1234" -> a b]} { puts "$a $b" }
puts [regsub -all {\s+} "a   b  c" " "]
