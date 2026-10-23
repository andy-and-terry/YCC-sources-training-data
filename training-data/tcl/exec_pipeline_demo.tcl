# Running external commands with exec
puts [exec echo "hello from exec"]

# Pipelines are written with | directly
set upper [exec echo "make me loud" | tr a-z A-Z]
puts $upper

# Capture failure through catch
if {[catch {exec sh -c "exit 3"} msg opts]} {
    set code [lindex [dict get $opts -errorcode] end]
    puts "command failed, exit code $code"
}

# stderr is merged into the result with 2>@1
set out [exec sh -c "echo out; echo err >&2" 2>@1]
puts [lsort [split $out \n]]

# Open a command as a channel
set pipe [open "|sort -r" r+]
puts $pipe "apple\nbanana\ncherry"
close $pipe w
puts [string trim [read $pipe]]
close $pipe
