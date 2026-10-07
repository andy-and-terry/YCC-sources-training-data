proc find_first {items target} {
    set i 0
    foreach item $items {
        if {$item eq $target} { return $i }
        incr i
    }
    return -1
}
puts [find_first {a b c} b]
puts [find_first {a b c} z]

proc risky {n} {
    if {$n < 0} {
        return -code error -errorcode {MYAPP NEGATIVE} "negative: $n"
    }
    return [expr {sqrt($n)}]
}

foreach n {16 -4} {
    set code [catch {risky $n} result opts]
    puts "code=$code result=$result"
    if {$code == 1} {
        puts "errorcode=[dict get $opts -errorcode]"
    }
}

set rc [catch {return -code break} r]
puts "break code: $rc"
