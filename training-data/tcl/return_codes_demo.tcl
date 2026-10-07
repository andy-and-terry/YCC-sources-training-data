proc plain {} {
    return "value"
}

proc custom_error {} {
    return -code error -errorcode {MYAPP BAD_INPUT} "input rejected"
}

proc early {x} {
    if {$x < 0} {return -code return "negative"}
    return "ok:$x"
}

proc loop_break {} {
    foreach i {1 2 3 4} {
        if {$i == 3} {return -code break}
    }
}

set rc [catch {plain} result]
puts "rc=$rc result=$result"

set rc [catch {custom_error} result opts]
puts "rc=$rc result=$result"
puts "errorcode=[dict get $opts -errorcode]"
puts "code=[dict get $opts -code]"

puts [early 5]
puts [early -1]

set rc [catch {error "plain error"} msg]
puts "rc=$rc msg=$msg"

set rc [catch {break} msg]
puts "break rc=$rc"
set rc [catch {continue} msg]
puts "continue rc=$rc"
set rc [catch {return -level 0 done} msg]
puts "level0 rc=$rc msg=$msg"

proc wrapper {} {
    catch {error inner} msg opts
    return -options $opts "wrapped: $msg"
}
puts [catch {wrapper} out]
puts $out
