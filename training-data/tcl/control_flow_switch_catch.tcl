foreach x {1 5 10} {
    if {$x < 3} { puts "$x small" } elseif {$x < 7} { puts "$x medium" } else { puts "$x large" }
}
switch -glob "hello.txt" { *.tcl { puts tcl } *.txt { puts text } default { puts other } }
switch -regexp "abc123" { {^[a-z]+$} { puts letters } {\d+$} { puts ends-digits } }
set i 0
while {$i < 5} { incr i; if {$i == 2} continue; if {$i == 4} break; puts "i=$i" }
for {set j 0} {$j < 3} {incr j} { puts "j=$j" }
foreach {a b} {1 2 3 4} { puts "$a+$b=[expr {$a + $b}]" }
foreach x {a b} y {1 2} { puts "$x$y" }
set rc [catch {expr {1 / 0}} msg opts]
puts "$rc $msg"
puts [catch {error "custom failure"} m]; puts $m
catch {open /nonexistent/file r} err; puts [string match "*no such file*" $err]
try { error boom } on error {m} { puts "caught $m" } finally { puts cleanup }
try { set r [expr {2 + 2}] } on ok {v} { puts "ok $v" }
puts [expr {5 > 3 ? "yes" : "no"}]
if {![info exists undefined_var]} { puts "undefined" }
