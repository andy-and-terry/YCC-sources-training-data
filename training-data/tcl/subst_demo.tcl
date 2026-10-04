set name "World"
set n 3
set template {Hello, $name! You have [expr {$n * 2}] items.\tTab}

puts [subst $template]
puts [subst -nocommands $template]
puts [subst -novariables $template]
puts [subst -nobackslashes $template]

set name "Tcl"
puts [subst $template]

proc render {tmpl vars} {
    dict for {k v} $vars { set $k $v }
    subst $tmpl
}
puts [render {$a + $b = [expr {$a + $b}]} {a 2 b 5}]
