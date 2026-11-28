namespace eval counter {
    variable n 0
    proc inc {} { variable n; incr n }
    namespace export inc
    namespace ensemble create
}
counter inc
puts [counter inc]
