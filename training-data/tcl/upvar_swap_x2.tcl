proc swap {a b} {
    upvar 1 $a x $b y
    lassign [list $y $x] x y
}
set p 1; set q 2
swap p q
puts "$p $q"
