namespace eval counter { variable n 0; proc inc {} { variable n; incr n } }
counter::inc; counter::inc
puts $counter::n
