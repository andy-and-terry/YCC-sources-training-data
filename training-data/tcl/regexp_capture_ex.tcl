if {[regexp {(\d+)-(\d+)} "call 555-1234 now" -> a b]} {
    puts "a=$a b=$b"
}
puts [regsub -all {\s+} "a   b  c" " "]
puts [string match "*.txt" "file.txt"]
