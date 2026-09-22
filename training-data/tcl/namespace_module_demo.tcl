namespace eval ::stringutil {
    namespace export reverse shout

    proc reverse {s} {
        return [join [lreverse [split $s ""]] ""]
    }

    proc shout {s} {
        return "[string toupper $s]!"
    }
}

namespace import ::stringutil::*

puts [reverse "hello"]
puts [shout "hello"]
puts [::stringutil::reverse "tcl"]
