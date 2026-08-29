array set parent {}

proc uf_init {n} {
    global parent
    for {set i 0} {$i < $n} {incr i} {
        set parent($i) $i
    }
}

proc uf_find {x} {
    global parent
    if {$parent($x) == $x} {
        return $x
    }
    return [uf_find $parent($x)]
}

proc uf_union {x y} {
    global parent
    set rootX [uf_find $x]
    set rootY [uf_find $y]
    if {$rootX != $rootY} {
        set parent($rootX) $rootY
    }
}

uf_init 5
uf_union 0 1
uf_union 1 2
puts [expr {[uf_find 0] == [uf_find 2]}]
puts [expr {[uf_find 0] == [uf_find 3]}]
