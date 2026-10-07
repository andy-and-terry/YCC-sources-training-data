rename unknown _original_unknown

proc unknown {cmd args} {
    if {[string match "get_*" $cmd]} {
        set key [string range $cmd 4 end]
        return "value-of-$key"
    }
    uplevel 1 [list _original_unknown $cmd {*}$args]
}

puts [get_color]
puts [get_size]
puts [expr {1 + 2}]
if {[catch {nosuchcommand 1 2} err]} {
    puts "error: $err"
}
