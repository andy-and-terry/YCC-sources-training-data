array set graph {
    0 1
    1 2
    2 {0 3}
    3 {}
}

proc hasCycle {} {
    global graph visited onStack
    array set visited {}
    array set onStack {}
    foreach node [array names graph] {
        set visited($node) 0
        set onStack($node) 0
    }
    foreach node [array names graph] {
        if {$visited($node) == 0} {
            if {[dfsVisit $node]} {
                return 1
            }
        }
    }
    return 0
}

proc dfsVisit {node} {
    global graph visited onStack
    set visited($node) 1
    set onStack($node) 1
    foreach neighbor $graph($node) {
        if {$visited($neighbor) == 0} {
            if {[dfsVisit $neighbor]} {
                return 1
            }
        } elseif {$onStack($neighbor)} {
            return 1
        }
    }
    set onStack($node) 0
    return 0
}

if {[hasCycle]} {
    puts "cycle detected"
} else {
    puts "no cycle"
}
