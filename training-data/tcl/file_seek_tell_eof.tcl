set name [file join [pwd] seek_demo.tmp]
set f [open $name w]
puts -nonewline $f "0123456789ABCDEF"
close $f

set f [open $name r]
seek $f 10 start
puts [read $f 3]
puts [tell $f]
seek $f -2 end
puts [read $f]
puts [eof $f]
close $f
file delete $name
