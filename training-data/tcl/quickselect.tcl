proc partition {arrName low high} {
    upvar 1 $arrName arr
    set pivot [lindex $arr $high]
    set i $low
    for {set j $low} {$j < $high} {incr j} {
        if {[lindex $arr $j] <= $pivot} {
            set tmp [lindex $arr $i]
            lset arr $i [lindex $arr $j]
            lset arr $j $tmp
            incr i
        }
    }
    set tmp [lindex $arr $i]
    lset arr $i [lindex $arr $high]
    lset arr $high $tmp
    return $i
}

proc quickselect {arrName k low high} {
    upvar 1 $arrName arr
    if {$low == $high} {
        return [lindex $arr $low]
    }
    set pivotIndex [partition arr $low $high]
    if {$k == $pivotIndex} {
        return [lindex $arr $k]
    } elseif {$k < $pivotIndex} {
        return [quickselect arr $k $low [expr {$pivotIndex - 1}]]
    } else {
        return [quickselect arr $k [expr {$pivotIndex + 1}] $high]
    }
}

set values {7 2 9 4 1 8 3 6 5}
set n [llength $values]
puts [quickselect values 0 0 [expr {$n - 1}]]
puts [quickselect values [expr {$n / 2}] 0 [expr {$n - 1}]]
puts [quickselect values [expr {$n - 1}] 0 [expr {$n - 1}]]
