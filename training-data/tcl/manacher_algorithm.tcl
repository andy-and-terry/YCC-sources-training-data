proc manacherLongest {s} {
    set transformed "#"
    foreach c [split $s {}] {
        append transformed "$c#"
    }
    set n [string length $transformed]
    set p [lrepeat $n 0]
    set center 0
    set right 0
    set bestLen 0
    set bestCenter 0

    for {set i 0} {$i < $n} {incr i} {
        if {$i < $right} {
            set mirror [expr {2 * $center - $i}]
            lset p $i [expr {min($right - $i, [lindex $p $mirror])}]
        }
        while {[expr {$i - [lindex $p $i] - 1}] >= 0 \
               && [expr {$i + [lindex $p $i] + 1}] < $n \
               && [string index $transformed [expr {$i - [lindex $p $i] - 1}]] eq [string index $transformed [expr {$i + [lindex $p $i] + 1}]]} {
            lset p $i [expr {[lindex $p $i] + 1}]
        }
        if {[expr {$i + [lindex $p $i]}] > $right} {
            set center $i
            set right [expr {$i + [lindex $p $i]}]
        }
        if {[lindex $p $i] > $bestLen} {
            set bestLen [lindex $p $i]
            set bestCenter $i
        }
    }

    set start [expr {($bestCenter - $bestLen) / 2}]
    return [string range $s $start [expr {$start + $bestLen - 1}]]
}

proc min {a b} { return [expr {$a < $b ? $a : $b}] }

puts [manacherLongest "babad"]
puts [manacherLongest "cbbd"]
