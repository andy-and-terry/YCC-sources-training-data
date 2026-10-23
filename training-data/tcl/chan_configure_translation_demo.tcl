# chan configure controls newline translation, buffering and encoding.
set path [file join [expr {[info exists ::env(TMPDIR)] ? $::env(TMPDIR) : "/tmp"}] chan_cfg_demo.txt]

set fh [open $path w]
chan configure $fh -translation crlf -encoding utf-8
puts $fh "line one"
puts $fh "line two"
close $fh

puts "size with CRLF: [file size $path]"

set fh [open $path r]
chan configure $fh -translation binary
set raw [read $fh]
close $fh
puts [string length $raw]
puts [string map [list \r CR \n LF] $raw]

set fh [open $path r]
chan configure $fh -translation auto
puts [gets $fh]
puts "buffering: [chan configure $fh -buffering]"
chan configure $fh -buffering none
puts "buffering now: [chan configure $fh -buffering]"
close $fh
file delete $path
