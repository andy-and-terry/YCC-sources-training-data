proc inner {x} {
    if {$x > 2} { error "value too large: $x" }
    return $x
}
proc outer {x} {
    return [inner [expr {$x + 1}]]
}

if {[catch {outer 5} msg opts]} {
    puts "message: $msg"
    puts "errorcode: [dict get $opts -errorcode]"
    puts "has stack: [expr {[string first inner [dict get $opts -errorinfo]] >= 0}]"
}

proc cleanup_demo {} {
    try {
        error "boom"
    } on error {m} {
        puts "caught $m"
        return handled
    } finally {
        puts "finally runs"
    }
}
puts [cleanup_demo]
puts [info level]
