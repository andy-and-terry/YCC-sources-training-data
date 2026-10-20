array set colors {red #f00 green #0f0}
set colors(blue) #00f
puts [lsort [array names colors]]
puts [array size colors]
puts $colors(red)
puts [info exists colors(pink)]
foreach {k v} [lsort -stride 2 [array get colors]] { puts "$k=$v" }
unset colors(red)
puts [array exists colors]
namespace eval counter {
    variable n 0
    proc incr_n {} { variable n; incr n }
    proc get {} { variable n; return $n }
    namespace export incr_n get
}
counter::incr_n; counter::incr_n
puts [counter::get]
namespace eval util { proc double x { expr {$x * 2} } }
namespace import ::counter::*
puts [get]
puts [util::double 21]
puts [namespace exists util]
puts [namespace children ::]
set ::global_var 42
proc show_global {} { global global_var; return $global_var }
puts [show_global]
set name Ada
puts "Hello ${name}!"
puts [set name]
puts [subst {$name has [string length $name] chars}]
