puts [::tcl::mathop::+ 1 2 3 4]
puts [::tcl::mathop::* 2 3 4]
puts [::tcl::mathop::< 1 2 3]
puts [::tcl::mathop::max 3 9 4]

namespace import ::tcl::mathop::+
puts [+ {*}{10 20 30}]

set nums {4 8 15 16 23 42}
puts [tcl::mathop::+ {*}$nums]
puts [::tcl::mathop::** 2 8]
