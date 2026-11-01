set rc [catch {expr {1 / 0}} msg]
puts "rc=$rc msg=$msg"
if {[catch {error "custom failure"} err]} { puts "caught: $err" }
try {
    error "boom"
} on error {m} {
    puts "try caught: $m"
} finally {
    puts "finally"
}
