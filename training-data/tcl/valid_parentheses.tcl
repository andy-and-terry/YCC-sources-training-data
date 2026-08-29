proc is_valid {s} {
    array set pairs {")" "(" "]" "[" "}" "{"}
    set stack {}
    foreach c [split $s ""] {
        if {$c eq "(" || $c eq "\[" || $c eq "\{"} {
            lappend stack $c
        } elseif {[info exists pairs($c)]} {
            if {[llength $stack] == 0 || [lindex $stack end] ne $pairs($c)} {
                return 0
            }
            set stack [lrange $stack 0 end-1]
        }
    }
    return [expr {[llength $stack] == 0}]
}

puts [is_valid "{\[()\]}"]
puts [is_valid "{\[(\])}"]
