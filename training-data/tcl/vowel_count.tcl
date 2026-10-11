proc countVowels {s} {
    set n 0
    foreach c [split [string tolower $s] ""] {
        if {$c in {a e i o u}} { incr n }
    }
    return $n
}

puts [countVowels "Programming in Tcl"]
puts [countVowels "rhythm"]
puts [llength [regexp -all -inline -nocase {[aeiou]} "Programming in Tcl"]]
