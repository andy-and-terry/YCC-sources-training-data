proc validate {n} {
    if {$n < 0} {
        return -code error "negative value: $n"
    }
    if {$n == 0} {
        return -code break
    }
    return -code ok [expr {sqrt($n)}]
}

foreach v {16 -1 25} {
    set code [catch {validate $v} result]
    puts "validate $v: code=$code result=$result"
}

foreach v {4 9 0 100} {
    set code [catch {validate $v} result]
    if {$code == 3} {
        puts "break signalled at $v"
        break
    }
    puts "sqrt($v) = $result"
}

proc early {} {
    foreach i {1 2 3} {
        if {$i == 2} { return "returned at $i" }
    }
    return "never"
}
puts [early]
