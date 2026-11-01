proc incr_var {name} { upvar 1 $name v; incr v }
set count 5
incr_var count
puts $count
proc run_in_caller {script} { uplevel 1 $script }
run_in_caller {set zzz 42}
puts $zzz
