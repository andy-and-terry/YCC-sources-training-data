set path [file join [expr {[info exists ::env(TMPDIR)] ? $::env(TMPDIR) : "/tmp"}] "tcl_demo_[pid].txt"]

set fh [open $path w]
puts $fh "line one"
puts $fh "line two"
puts -nonewline $fh "line three"
close $fh

puts "exists: [file exists $path]"
puts "size: [file size $path]"

set fh [open $path r]
set content [read $fh]
close $fh
puts [string length $content]

set fh [open $path r]
while {[gets $fh line] >= 0} {
    puts "read: $line"
}
close $fh

set fh [open $path a]
puts $fh "\nappended"
close $fh

set fh [open $path]
set lines [split [read $fh] "\n"]
close $fh
puts "line count: [llength $lines]"
puts "last: [lindex $lines end]"

puts [file tail $path]
puts [file extension $path]
puts [file rootname [file tail $path]]
puts [file isfile $path]
puts [file isdirectory [file dirname $path]]

if {[catch {open /nonexistent/dir/file r} err]} {
    puts "open failed: [string range $err 0 20]"
}

file delete $path
puts "after delete: [file exists $path]"
