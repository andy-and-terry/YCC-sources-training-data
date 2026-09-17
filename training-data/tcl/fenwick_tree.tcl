array set fenwick {}
set fenwickSize 0

proc fenwickInit {size} {
    global fenwick fenwickSize
    set fenwickSize $size
    for {set i 0} {$i <= $size} {incr i} {
        set fenwick($i) 0
    }
}

proc fenwickAdd {index delta} {
    global fenwick fenwickSize
    set i [expr {$index + 1}]
    while {$i <= $fenwickSize} {
        incr fenwick($i) $delta
        incr i [expr {$i & (-$i)}]
    }
}

proc fenwickPrefixSum {index} {
    global fenwick
    set i [expr {$index + 1}]
    set total 0
    while {$i > 0} {
        incr total $fenwick($i)
        incr i [expr {-($i & (-$i))}]
    }
    return $total
}

proc fenwickRangeSum {left right} {
    set rightSum [fenwickPrefixSum $right]
    set leftSum [expr {$left > 0 ? [fenwickPrefixSum [expr {$left - 1}]] : 0}]
    return [expr {$rightSum - $leftSum}]
}

fenwickInit 6
set values {1 3 5 7 9 11}
for {set i 0} {$i < 6} {incr i} {
    fenwickAdd $i [lindex $values $i]
}
puts [fenwickRangeSum 1 3]
