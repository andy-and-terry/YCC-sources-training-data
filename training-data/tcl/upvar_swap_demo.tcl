proc swap {varA varB} {
    upvar $varA a
    upvar $varB b
    set tmp $a
    set a $b
    set b $tmp
}

set x 10
set y 20
swap x y
puts "x=$x y=$y"

proc accumulate {targetVar value} {
    upvar $targetVar total
    if {![info exists total]} {
        set total 0
    }
    incr total $value
}

set runningTotal 0
accumulate runningTotal 5
accumulate runningTotal 15
puts $runningTotal
