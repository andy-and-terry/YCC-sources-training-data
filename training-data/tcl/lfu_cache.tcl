array set values {}
array set freqs {}
set capacity 2
set minFreq 0

proc lfuTouch {key} {
    global freqs minFreq
    set f $freqs($key)
    incr freqs($key)
    if {$f == $minFreq} {
        set stillPresent 0
        foreach k [array names freqs] {
            if {$freqs($k) == $f} { set stillPresent 1; break }
        }
        if {!$stillPresent} { incr minFreq }
    }
}

proc lfuGet {key} {
    global values
    if {![info exists values($key)]} { return {} }
    lfuTouch $key
    return $values($key)
}

proc lfuPut {key value} {
    global values freqs capacity minFreq
    if {[info exists values($key)]} {
        set values($key) $value
        lfuTouch $key
        return
    }
    if {[array size values] >= $capacity} {
        foreach k [array names freqs] {
            if {$freqs($k) == $minFreq} {
                unset values($k)
                unset freqs($k)
                break
            }
        }
    }
    set values($key) $value
    set freqs($key) 0
    set minFreq 0
}

lfuPut 1 10
lfuPut 2 20
puts [lfuGet 1]
lfuPut 3 30
puts [lfuGet 2]
puts [lfuGet 3]
