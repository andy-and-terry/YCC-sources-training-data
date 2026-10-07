# Create a safe interpreter and expose only selected commands.
set sandbox [interp create -safe]

interp alias $sandbox log {} puts

$sandbox eval {log "hello from sandbox"}

# Dangerous commands are not available in a safe interpreter.
if {[catch {$sandbox eval {exec ls}} err]} {
    puts "blocked: $err"
}

# Alias to a host-side procedure
proc add {a b} { expr {$a + $b} }
interp alias $sandbox add {} add
puts [$sandbox eval {add 2 3}]

interp delete $sandbox
