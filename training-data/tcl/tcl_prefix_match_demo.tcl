# tcl::prefix resolves abbreviations against a list of full names.
set commands {start stop status restart}

puts [tcl::prefix match $commands sto]
puts [tcl::prefix match $commands rest]

# Ambiguous prefix raises an error; catch it.
if {[catch {tcl::prefix match $commands st} err]} {
    puts "error: $err"
}

# -error {} returns an empty string instead of raising.
puts "[tcl::prefix match -error {} $commands xyz]|"

# -exact accepts only complete names.
if {[catch {tcl::prefix match -exact $commands sta} err]} {
    puts "exact failed"
}

# tcl::prefix all lists every candidate for a prefix.
puts [tcl::prefix all $commands st]
puts [tcl::prefix longest $commands res]
