proc check {value} {
    set kinds {}
    foreach type {integer double alpha alnum digit upper lower space boolean} {
        if {[string is $type -strict $value]} { lappend kinds $type }
    }
    return $kinds
}

foreach v {42 3.14 hello abc123 HELLO yes " "} {
    puts "'$v': [check $v]"
}

proc parse_port {s} {
    if {![string is integer -strict $s]} {
        return -code error "not a number: $s"
    }
    if {$s < 1 || $s > 65535} {
        return -code error "out of range: $s"
    }
    return $s
}
foreach p {8080 0 abc} {
    if {[catch {parse_port $p} r]} { puts "bad: $r" } else { puts "ok: $r" }
}
