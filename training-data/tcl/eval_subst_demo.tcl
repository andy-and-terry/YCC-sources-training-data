set cmd {puts "sum is [expr {1 + 2}]"}
eval $cmd

set args {-nonewline "no newline\n"}
eval puts $args

set name World
set tmpl {Hello, $name! 1+1=[expr {1+1}]}
puts [subst $tmpl]
puts [subst -nocommands $tmpl]
puts [subst -novariables $tmpl]

set script {
    set a 5
    set b 7
    expr {$a * $b}
}
puts [eval $script]
puts [uplevel #0 {set a}]
