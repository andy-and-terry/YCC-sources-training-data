package provide mathutils 1.0

namespace eval ::mathutils {
    namespace export square cube

    proc square {x} {
        return [expr {$x * $x}]
    }

    proc cube {x} {
        return [expr {$x * $x * $x}]
    }
}

package require mathutils 1.0
namespace import ::mathutils::*

puts [square 5]
puts [cube 3]
puts "mathutils version in use: [package present mathutils]"
