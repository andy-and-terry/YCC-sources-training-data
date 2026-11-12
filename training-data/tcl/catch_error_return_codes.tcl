set rc [catch {expr {1 / 0}} msg]
puts "$rc $msg"
if {[catch {error "custom"} m]} { puts "caught: $m" }
