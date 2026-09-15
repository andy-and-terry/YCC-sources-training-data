array set tree {}
set treeSize 0

proc seg_build {values} {
    global tree treeSize
    set n [llength $values]
    set treeSize [expr {4 * ($n + 1)}]
    for {set i 0} {$i < $treeSize} {incr i} {
        set tree($i) 0
    }
    seg_build_rec $values 1 0 [expr {$n - 1}]
}

proc seg_build_rec {values node lo hi} {
    global tree
    if {$lo == $hi} {
        set tree($node) [lindex $values $lo]
        return
    }
    set mid [expr {($lo + $hi) / 2}]
    set leftNode [expr {2 * $node}]
    set rightNode [expr {2 * $node + 1}]
    seg_build_rec $values $leftNode $lo $mid
    seg_build_rec $values $rightNode [expr {$mid + 1}] $hi
    set tree($node) [expr {$tree($leftNode) + $tree($rightNode)}]
}

proc seg_query {node lo hi ql qr} {
    global tree
    if {$qr < $lo || $hi < $ql} {
        return 0
    }
    if {$ql <= $lo && $hi <= $qr} {
        return $tree($node)
    }
    set mid [expr {($lo + $hi) / 2}]
    set left [seg_query [expr {2 * $node}] $lo $mid $ql $qr]
    set right [seg_query [expr {2 * $node + 1}] [expr {$mid + 1}] $hi $ql $qr]
    return [expr {$left + $right}]
}

proc seg_range_sum {n ql qr} {
    return [seg_query 1 0 [expr {$n - 1}] $ql $qr]
}

set data {1 3 5 7 9 11}
seg_build $data
puts [seg_range_sum [llength $data] 1 3]
puts [seg_range_sum [llength $data] 0 5]
