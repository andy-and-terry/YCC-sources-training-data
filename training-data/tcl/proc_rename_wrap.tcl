proc greet {name} {
    return "Hello, $name"
}

rename greet greet_orig

proc greet {name} {
    puts "calling greet with $name"
    set result [greet_orig [string toupper $name]]
    puts "returned $result"
    return $result
}

greet bob

# Deleting a command by renaming it to the empty string
rename greet_orig {}
puts [info commands greet_orig]
