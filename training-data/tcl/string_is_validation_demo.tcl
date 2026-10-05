proc check {type value} {
    expr {[string is $type -strict $value] ? "yes" : "no"}
}

foreach v {42 -7 3.14 abc "" 0x1F} {
    puts [format "%-6s integer=%-3s double=%-3s alpha=%s" \
        "'$v'" [check integer $v] [check double $v] [check alpha $v]]
}

puts [string is digit 123]
puts [string is upper ABC]
puts [string is space "  "]
puts [string is boolean yes]
puts [string is xdigit ff09]

proc parse_port {text} {
    if {![string is integer -strict $text] || $text < 1 || $text > 65535} {
        error "invalid port: $text"
    }
    return $text
}
puts [parse_port 8080]
puts [catch {parse_port 99999} msg]
puts $msg
