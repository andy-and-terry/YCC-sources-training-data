oo::class create Animal {
    variable name
    constructor {n} { set name $n }
    method speak {} { return "$name makes a sound" }
    method name {} { return $name }
}
oo::class create Dog {
    superclass Animal
    variable tricks
    constructor {n} { next $n; set tricks {} }
    method speak {} { return "[my name] barks" }
    method learn {t} { lappend tricks $t; return [self] }
    method tricks {} { return $tricks }
}
set d [Dog new Rex]
puts [$d speak]
$d learn sit
$d learn roll
puts [$d tricks]
puts [[Animal new Gen] speak]
puts [info object class $d]
puts [$d isa Animal]
oo::class create Counter {
    variable n
    constructor {} { set n 0 }
    method incr {} { incr n }
    export incr
    unexport destroy
}
set c [Counter new]
$c incr; $c incr
puts [$c incr]
oo::define Counter method reset {} { set n 0 }
$c reset
puts [$c incr]
