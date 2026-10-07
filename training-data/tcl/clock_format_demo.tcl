set start [clock scan "2024-01-15 10:30:00" -format "%Y-%m-%d %H:%M:%S" -gmt 1]
puts [clock format $start -format "%A, %B %d, %Y" -gmt 1]

set future [clock add $start 30 days]
puts [clock format $future -format "%Y-%m-%d" -gmt 1]

set diffDays [expr {($future - $start) / 86400}]
puts $diffDays

set earlier [clock add $start -2 hours]
puts [clock format $earlier -format "%H:%M:%S" -gmt 1]
