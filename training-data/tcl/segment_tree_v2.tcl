array set tree {}
set treeSize 0

proc seg_build {values} {
    global tree treeSize
    set n [llength $values]
    set treeSize [expr {4 * $n}]
    for {set i 0} {$i < $treeSize} {incr i} {
        set tree($i) 0
    }
    seg_build_range $values 0 0 [expr {$n - 1}]
}

proc seg_build_range {values node left right} {
    global tree
    if {$left == $right} {
        set tree($node) [lindex $values $left]
        return
    }
    set mid [expr {($left + $right) / 2}]
    set leftChild [expr {2 * $node + 1}]
    set rightChild [expr {2 * $node + 2}]
    seg_build_range $values $leftChild $left $mid
    seg_build_range $values $rightChild [expr {$mid + 1}] $right
    set tree($node) [expr {$tree($leftChild) + $tree($rightChild)}]
}

proc seg_query {node left right qlow qhigh} {
    global tree
    if {$qhigh < $left || $right < $qlow} {
        return 0
    }
    if {$qlow <= $left && $right <= $qhigh} {
        return $tree($node)
    }
    set mid [expr {($left + $right) / 2}]
    set leftSum [seg_query [expr {2 * $node + 1}] $left $mid $qlow $qhigh]
    set rightSum [seg_query [expr {2 * $node + 2}] [expr {$mid + 1}] $right $qlow $qhigh]
    return [expr {$leftSum + $rightSum}]
}

proc seg_update {node left right index value} {
    global tree
    if {$left == $right} {
        set tree($node) $value
        return
    }
    set mid [expr {($left + $right) / 2}]
    set leftChild [expr {2 * $node + 1}]
    set rightChild [expr {2 * $node + 2}]
    if {$index <= $mid} {
        seg_update $leftChild $left $mid $index $value
    } else {
        seg_update $rightChild [expr {$mid + 1}] $right $index $value
    }
    set tree($node) [expr {$tree($leftChild) + $tree($rightChild)}]
}

set values {1 3 5 7 9 11}
seg_build $values
set n [llength $values]

puts [seg_query 0 0 [expr {$n - 1}] 1 3]
seg_update 0 0 [expr {$n - 1}] 1 10
puts [seg_query 0 0 [expr {$n - 1}] 1 3]
