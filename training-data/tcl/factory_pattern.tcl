oo::class create Shape {
    method area {} {
        return 0
    }
}

oo::class create Circle {
    superclass Shape
    variable radius

    constructor {r} {
        set radius $r
    }

    method area {} {
        return [expr {3.14159265 * $radius * $radius}]
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

proc shape_factory {type args} {
    switch -- $type {
        circle {
            return [Circle new {*}$args]
        }
        square {
            return [Square new {*}$args]
        }
        default {
            error "unknown shape type: $type"
        }
    }
}

set shapes [list [shape_factory circle 2] [shape_factory square 3]]

foreach s $shapes {
    puts [$s area]
}

foreach s $shapes {
    $s destroy
}
