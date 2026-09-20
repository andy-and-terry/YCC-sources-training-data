oo::class create Shape {
    method area {} {
        error "not implemented"
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

proc shape_factory {kind args} {
    switch -- $kind {
        circle { return [Circle new {*}$args] }
        square { return [Square new {*}$args] }
        default { error "unknown shape: $kind" }
    }
}

set shapes [list [shape_factory circle 2] [shape_factory square 3]]
foreach shape $shapes {
    puts [$shape area]
}
