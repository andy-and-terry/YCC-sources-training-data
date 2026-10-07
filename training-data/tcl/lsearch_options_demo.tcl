set items {apple banana cherry date banana fig}

puts [lsearch $items banana]
puts [lsearch -all $items banana]
puts [lsearch -all -inline $items banana]
puts [lsearch -glob -inline -all $items "*a*"]
puts [lsearch -regexp -inline -all $items {^[bd]}]
puts [lsearch -start 3 $items banana]
