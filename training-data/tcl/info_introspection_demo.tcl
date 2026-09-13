proc greet {name {greeting "Hello"}} {
    return "$greeting, $name!"
}

puts [info exists nonexistentVar]
set myVar 42
puts [info exists myVar]

puts [info args greet]
puts [info default greet greeting defaultValue]

puts [info procs greet]
puts [info body greet]

proc showLevel {} {
    puts [info level]
    puts [info level 0]
}
showLevel
