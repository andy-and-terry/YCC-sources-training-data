set s "hELLO wORLD"

puts [string toupper $s]
puts [string tolower $s]
puts [string totitle $s]

# capitalize each word
set words {}
foreach w [split $s " "] {
    lappend words [string totitle $w]
}
puts [join $words " "]

# only convert part of the string with first/last indices
puts [string toupper "abcdef" 1 3]

# case-insensitive comparison
puts [string equal -nocase "Tcl" "TCL"]
