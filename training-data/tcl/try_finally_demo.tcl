proc riskyDivide {a b} {
    if {$b == 0} {
        throw {ARITH DIVZERO} "division by zero"
    }
    return [expr {$a / $b}]
}

try {
    puts [riskyDivide 10 2]
} on error {msg} {
    puts "error: $msg"
} finally {
    puts "attempted first division"
}

try {
    puts [riskyDivide 5 0]
} trap {ARITH DIVZERO} {msg} {
    puts "caught division error: $msg"
} finally {
    puts "attempted second division"
}
