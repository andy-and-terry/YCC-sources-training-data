set rc [catch {expr {1 / 0}} msg opts]
puts "rc=$rc msg=$msg"
if {[catch {error "custom" "info"} m]} { puts "caught: $m" }
