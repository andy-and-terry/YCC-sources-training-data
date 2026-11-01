proc greet {name {greeting Hello} args} {
    return "$greeting, $name! extras=[llength $args]"
}
puts [greet World]
puts [greet World Hi a b c]
