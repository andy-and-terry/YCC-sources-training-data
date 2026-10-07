set path [file join [expr {[info exists ::env(TMPDIR)] ? $::env(TMPDIR) : "/tmp"}] "tcl_io_demo.txt"]

set fh [open $path w]
puts $fh "first line"
puts $fh "second line"
puts -nonewline $fh "no newline at end"
close $fh

set fh [open $path r]
set n 0
while {[gets $fh line] >= 0} {
    incr n
    puts "$n: $line"
}
close $fh

set fh [open $path r]
set content [read $fh]
close $fh
puts "bytes: [string length $content]"
puts "size on disk: [file size $path]"

file delete $path
puts "exists after delete: [file exists $path]"
