set tmp [file join [expr {[info exists ::env(TMPDIR)] ? $::env(TMPDIR) : "/tmp"}] tcl_demo_[pid]]
file mkdir $tmp
set f [file join $tmp a.txt]
set fh [open $f w]
puts $fh "line one"
puts $fh "line two"
puts -nonewline $fh "no newline"
close $fh
set fh [open $f r]
while {[gets $fh line] >= 0} { puts "got: $line" }
close $fh
puts [file size $f]
set fh [open $f r]; set data [read $fh]; close $fh
puts [llength [split $data \n]]
set fh [open $f a]; puts $fh "\nappended"; close $fh
puts [file exists $f] 
puts "[file extension $f] [file tail $f] [expr {[file dirname $f] eq $tmp}]"
puts [lsort [glob -nocomplain -directory $tmp *.txt]]
puts [file isdirectory $tmp]
file copy $f [file join $tmp b.txt]
puts [llength [glob -directory $tmp *]]
file delete -force $tmp
puts [file exists $tmp]
puts [file join a b c.txt]
puts [file rootname "x/y.tar.gz"]
