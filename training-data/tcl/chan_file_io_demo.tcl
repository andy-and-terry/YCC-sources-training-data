set path [file join [file dirname [info script]] tcl_chan_demo_temp.txt]

set outChan [open $path w]
puts $outChan "line one"
puts $outChan "line two"
puts $outChan "line three"
close $outChan

set inChan [open $path r]
set lineCount 0
while {[gets $inChan line] >= 0} {
    incr lineCount
    puts "read: $line"
}
close $inChan

puts "total lines: $lineCount"
file delete $path
