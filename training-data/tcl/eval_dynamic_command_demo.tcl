set cmd [list puts "hello world"]
eval $cmd

set args {-nonewline}
eval puts $args {"no newline"}
puts ""

proc add {a b} {expr {$a + $b}}
set op add
puts [$op 2 3]
puts [{*}$op 4 5]

set params {10 20}
puts [add {*}$params]
puts [add {*}{1 2}]

proc call_with_list {cmd args} {
    return [{*}$cmd {*}$args]
}
puts [call_with_list {string map {a A}} banana]
puts [call_with_list add 7 8]

set script {
    set total 0
    foreach n {1 2 3} {incr total $n}
    set total
}
puts [eval $script]
puts [uplevel #0 $script]

proc make_getter {varname} {
    return [list set $varname]
}
set color red
puts [eval [make_getter color]]

set dispatch {
    double {expr {$x * 2}}
    square {expr {$x * $x}}
}
set x 6
foreach {name body} $dispatch {
    puts "$name: [eval $body]"
}

set tmpl [list string repeat ab 3]
puts [{*}$tmpl]
rename add plus
puts [plus 1 1]
puts [catch {add 1 1} msg]
puts [info commands plus]
