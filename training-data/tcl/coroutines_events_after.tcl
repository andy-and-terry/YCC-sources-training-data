proc gen {} {
    yield
    for {set i 1} {$i <= 3} {incr i} { yield $i }
    return done
}
coroutine g gen
g
puts [g]; puts [g]; puts [g]; puts [g]
proc fibgen {} { yield [info coroutine]; set a 0; set b 1; while 1 { yield $a; lassign [list $b [expr {$a + $b}]] a b } }
coroutine fib fibgen
fib
set out {}
for {set i 0} {$i < 10} {incr i} { lappend out [fib] }
puts $out
set ::done 0
after 10 {set ::done 1}
vwait ::done
puts "after fired: $::done"
set id [after 1000 {puts never}]
after cancel $id
after idle {puts idle-ran}
update
set t0 [clock milliseconds]
after 20
puts [expr {[clock milliseconds] - $t0 >= 15}]
puts [llength [after info]]
