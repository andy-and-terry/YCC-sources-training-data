proc greet {name {greeting "Hello"}} {
    return "$greeting, $name!"
}
puts [greet World]
puts [greet Tcl Hi]
