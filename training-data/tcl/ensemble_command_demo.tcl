namespace eval ::shape {
    variable shapes {}

    proc create {name w h} {
        variable shapes
        dict set shapes $name [dict create width $w height $h]
    }

    proc area {name} {
        variable shapes
        set info [dict get $shapes $name]
        return [expr {[dict get $info width] * [dict get $info height]}]
    }

    proc list_all {} {
        variable shapes
        return [dict keys $shapes]
    }

    namespace export create area list_all
    namespace ensemble create
}

shape create box1 3 4
shape create box2 5 5

puts [shape area box1]
puts [shape area box2]
puts [shape list_all]

set map [namespace ensemble configure ::shape -map]
puts [lsort [dict keys $map]]
