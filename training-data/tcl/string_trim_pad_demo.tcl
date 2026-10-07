set s "  \t hello world \n"
puts "\[[string trim $s]\]"
puts "\[[string trimleft $s]\]"
puts "\[[string trimright $s]\]"
puts [string trim "xxhixx" x]
puts [string trimleft "007" 0]

proc padLeft {s width {ch " "}} {
    string cat [string repeat $ch [expr {max(0, $width - [string length $s])}]] $s
}
puts [padLeft 42 6 0]
puts [format %-8s| abc]
puts [format %8s| abc]
puts [string totitle "hello"]
puts [string range "abcdef" 2 end-1]
puts [string first lo "hello world"]
puts [string last o "hello world"]
