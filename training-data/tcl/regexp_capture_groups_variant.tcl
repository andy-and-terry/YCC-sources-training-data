if {[regexp {(\w+)@(\w+)\.com} "mail bob@example.com now" -> user host]} {
    puts "user=$user host=$host"
}
puts [regsub -all {\s+} "a   b  c" " "]
