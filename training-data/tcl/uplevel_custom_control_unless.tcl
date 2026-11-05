proc unless {cond body} {
    uplevel 1 [list if "!($cond)" $body]
}
set x 3
unless {$x > 5} { puts "x is not greater than 5" }
