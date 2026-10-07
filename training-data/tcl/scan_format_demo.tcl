set n [scan "12 apples" "%d %s" count what]
puts "$n: $count $what"

scan "3.5kg" "%f%s" weight unit
puts "$weight $unit"

scan "ff" %x hex
puts $hex

scan "2024-03-15" "%d-%d-%d" y m d
puts [format "%02d/%02d/%04d" $d $m $y]

puts [scan "abc" %d bad]
puts [scan "A" %c code]
puts $code
puts [format "%c" 66]
puts [format "%x %o %b" 255 8 5]
puts [format "%5.1f|%-5d|%05d" 3.14159 42 42]
