puts [format "%05d|%-6s|%6.2f" 42 abc 3.14159]
puts [format "%x %X %o %b" 255 255 8 5]
puts [format "%e" 12345.678]
puts [format "%c%c%c" 84 99 108]
puts [format "%s has %d items" cart 3]
puts [format "%%"]
puts [format "%+d % d" 5 5]
puts [format "%*d" 6 42]
puts [format "%2\$s %1\$s" world hello]

scan "12 apples 3.5" "%d %s %f" count fruit price
puts "$count $fruit $price"

set matches [scan "2024-03-15" "%d-%d-%d" y m d]
puts "$matches fields: $y/$m/$d"

puts [scan "ff" "%x" hex]
puts $hex
puts [scan "abc" "%d" bad]
puts [scan "A" "%c" code]
puts $code

set list [scan "10,20" "%d,%d"]
puts $list

puts [scan "hello world" "%s" first]
puts $first
puts [scan "  42" "%d" padded]
puts [scan "x=7" "x=%d" val]
puts $val
puts [scan "abcdef" "%3s%s" head tail]
puts "$head|$tail"
puts [format "%.3s" abcdef]
puts [format "%08.3f" -3.14159]
