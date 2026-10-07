set safe [interp create -safe]

puts [$safe eval {expr {6 * 7}}]

if {[catch {$safe eval {exec ls}} err]} {
    puts "blocked exec: $err"
}
if {[catch {$safe eval {open /etc/passwd r}} err]} {
    puts "blocked open: $err"
}

$safe alias greet apply {{name} {return "hello, $name"}}
puts [$safe eval {greet world}]

puts [lsort [$safe eval {info commands s*}]]
interp delete $safe
