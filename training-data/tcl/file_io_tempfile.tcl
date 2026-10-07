set path [file join [expr {[info exists ::env(TMPDIR)] ? $::env(TMPDIR) : "/tmp"}] "tcl_demo_[pid].txt"]

set fh [open $path w]
puts $fh "line one"
puts $fh "line two"
puts $fh "line three"
close $fh

set fh [open $path r]
set count 0
while {[gets $fh line] >= 0} {
    incr count
    puts "$count: $line"
}
close $fh

set fh [open $path a]
puts $fh "appended"
close $fh

set fh [open $path]
set data [read $fh]
close $fh
puts "lines: [llength [split [string trimright $data] \n]]"
puts "size: [file size $path]"
puts "ext: [file extension $path]"
file delete $path
puts "exists: [file exists $path]"
