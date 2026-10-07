set bitCount 64
array set bits {}
for {set i 0} {$i < $bitCount} {incr i} { set bits($i) 0 }

proc hashValue {str seed} {
    global bitCount
    set h $seed
    foreach c [split $str {}] {
        scan $c %c code
        set h [expr {($h * 31 + $code) % $bitCount}]
    }
    return [expr {abs($h) % $bitCount}]
}

proc bfInsert {str} {
    global bits
    foreach seed {7 17 29} {
        set bits([hashValue $str $seed]) 1
    }
}

proc bfMightContain {str} {
    global bits
    foreach seed {7 17 29} {
        if {!$bits([hashValue $str $seed])} {
            return 0
        }
    }
    return 1
}

bfInsert "apple"
bfInsert "banana"
puts [bfMightContain "apple"]
puts [bfMightContain "banana"]
puts [bfMightContain "cherry"]
