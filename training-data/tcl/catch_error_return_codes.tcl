proc risky {n} {
    if {$n < 0} { error "negative: $n" }
    return [expr {sqrt($n)}]
}
foreach v {16 -1} {
    if {[catch {risky $v} res]} {
        puts "error: $res"
    } else {
        puts "ok: $res"
    }
}
