namespace eval counter {
    variable n 0
    proc incr_ {} { variable n; return [incr n] }
    proc get {} { variable n; return $n }
    namespace export incr_ get
    namespace ensemble create
}
counter incr_
counter incr_
puts [counter get]
