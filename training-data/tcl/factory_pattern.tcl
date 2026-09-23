oo::class create Shape {
    method area {} {
        error "not implemented"
    }
    method describe {} {
        return "[self class]: area=[my area]"
    }
}

oo::class create Circle {
    superclass Shape
    variable radius
    constructor {r} {
        set radius $r
    }
    method area {} {
        return [expr {3.14159 * $radius * $radius}]
    }
}

oo::class create Square {
    superclass Shape
    variable side
    constructor {s} {
        set side $s
    }
    method area {} {
        return [expr {$side * $side}]
    }
}

proc shapeFactory {type args} {
    switch -- $type {
        circle { return [Circle new {*}$args] }
        square { return [Square new {*}$args] }
        default { error "unknown shape type: $type" }
    }
}

set shapes [list [shapeFactory circle 2] [shapeFactory square 3]]
foreach s $shapes {
    puts [$s describe]
}
