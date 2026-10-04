proc greet {greeting name} {
    return "$greeting, $name!"
}

interp alias {} hello {} greet Hello
interp alias {} goodbye {} greet Goodbye

puts [hello World]
puts [goodbye Tcl]

set safe [interp create -safe]
$safe alias double apply {{x} {expr {$x * 2}}}
puts [$safe eval {double 21}]

if {[catch {$safe eval {exec ls}} err]} {
    puts "blocked: $err"
}
interp delete $safe

puts [interp aliases]
