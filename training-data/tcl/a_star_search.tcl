array set graph {}
set graph(a) {{b 1} {c 4}}
set graph(b) {{c 2} {d 5}}
set graph(c) {{d 1}}
set graph(d) {}

array set heuristic {a 5 b 3 c 2 d 0}

proc aStar {source target} {
    global graph heuristic
    array set gScore {}
    foreach node [array names graph] { set gScore($node) 999999 }
    set gScore($source) 0
    set open [list $source]

    while {[llength $open] > 0} {
        set best -1
        set bestF 999999
        foreach node $open {
            set f [expr {$gScore($node) + $heuristic($node)}]
            if {$f < $bestF} {
                set bestF $f
                set best $node
            }
        }
        if {$best == $target} { return $gScore($best) }
        set open [lsearch -all -inline -not -exact $open $best]

        foreach edge $graph($best) {
            set neighbor [lindex $edge 0]
            set weight [lindex $edge 1]
            set tentative [expr {$gScore($best) + $weight}]
            if {$tentative < $gScore($neighbor)} {
                set gScore($neighbor) $tentative
                if {[lsearch -exact $open $neighbor] == -1} {
                    lappend open $neighbor
                }
            }
        }
    }
    return -1
}

puts [aStar a d]
