set text "price: 10 USD, tax: 2 USD, tip: 5 USD"

puts [regsub -all {(\d+) USD} $text {$\1}]
puts [regsub {USD} $text EUR]

# emulate a callback: rewrite each number by hand
set doubled ""
set pos 0
while {[regexp -start $pos -indices {\d+} $text span]} {
    lassign $span s e
    append doubled [string range $text $pos [expr {$s - 1}]]
    append doubled [expr {[string range $text $s $e] * 2}]
    set pos [expr {$e + 1}]
}
append doubled [string range $text $pos end]
puts $doubled

set snake "myVariableNameHere"
puts [string tolower [regsub -all {([A-Z])} $snake {_\1}]]

puts [regsub -all {\s+} "  too   many    spaces " " "]
puts [regsub -all -nocase {a} "Banana" "4"]
