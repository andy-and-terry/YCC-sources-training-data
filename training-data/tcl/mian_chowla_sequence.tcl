# Greedy sequence whose pairwise sums are all distinct.
set seq {}
array set sums {}
set cand 1
while {[llength $seq] < 8} {
    array unset fresh
    set ok 1
    foreach x [concat $seq [list $cand]] {
        set s [expr {$x + $cand}]
        if {[info exists sums($s)] || [info exists fresh($s)]} { set ok 0; break }
        set fresh($s) 1
    }
    if {$ok} {
        lappend seq $cand
        foreach s [array names fresh] { set sums($s) 1 }
    }
    incr cand
}
puts [join $seq " "]
