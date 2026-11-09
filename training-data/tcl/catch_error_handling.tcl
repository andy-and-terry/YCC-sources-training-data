if {[catch {expr {1 / 0}} err]} {
    puts "caught: $err"
}
catch {error "custom" "info" 42} msg opts
puts $msg
puts [dict get $opts -errorcode]
