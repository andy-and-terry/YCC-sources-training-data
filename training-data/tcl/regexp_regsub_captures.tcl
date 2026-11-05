if {[regexp {(\w+)@(\w+)\.com} "mail ann@example.com now" -> user host]} {
    puts "$user at $host"
}
puts [regsub -all {\d+} "a1b22c" "#"]
puts [regexp -all {a} "banana"]
