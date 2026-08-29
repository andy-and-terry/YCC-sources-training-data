set text "The year is 2024 and the month is 08"
set matches [regexp -all -inline {\d+} $text]
puts $matches

if {[regexp {(\w+)@(\w+)\.com} "user@example.com" -> user domain]} {
    puts "user=$user domain=$domain"
}
