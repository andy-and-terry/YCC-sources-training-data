proc makeCircle {radius} {
    return [list circle $radius]
}

proc makeSquare {side} {
    return [list square $side]
}

proc shapeArea {shape} {
    set kind [lindex $shape 0]
    switch -- $kind {
        circle { return [expr {3.14159 * [lindex $shape 1] * [lindex $shape 1]}] }
        square { return [expr {[lindex $shape 1] * [lindex $shape 1]}] }
        default { error "unknown shape: $kind" }
    }
}

proc shapeFactory {kind param} {
    switch -- $kind {
        circle { return [makeCircle $param] }
        square { return [makeSquare $param] }
        default { error "unknown shape kind: $kind" }
    }
}

foreach spec {{circle 3} {square 4}} {
    set shape [shapeFactory [lindex $spec 0] [lindex $spec 1]]
    puts "[lindex $shape 0] area: [shapeArea $shape]"
}
