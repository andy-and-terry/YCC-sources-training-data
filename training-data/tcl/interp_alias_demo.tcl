proc greet {name} {
    return "Hello, $name!"
}

set slave [interp create]
$slave eval {
    proc double {n} { return [expr {$n * 2}] }
}

interp alias {} greetAlias {} greet
puts [greetAlias "Ada"]

puts [$slave eval {double 21}]

$slave alias hostGreet greet
puts [$slave eval {hostGreet "Ada from slave"}]

interp delete $slave
