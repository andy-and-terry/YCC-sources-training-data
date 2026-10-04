enum Planet {
    MERCURY(3.303e+23, 2.4397e6),
    EARTH(5.976e+24, 6.37814e6),
    JUPITER(1.9e+27, 7.1492e7)

    final double mass
    final double radius

    Planet(double mass, double radius) {
        this.mass = mass
        this.radius = radius
    }

    double surfaceGravity() {
        6.67300E-11 * mass / (radius * radius)
    }

    Planet next() {
        values()[(ordinal() + 1) % values().length]
    }
}

Planet.values().each { p ->
    println "${p.name().padRight(8)} ${String.format('%.2f', p.surfaceGravity())}"
}

println Planet.valueOf('EARTH').next()
println Planet.JUPITER.next()
println Planet.EARTH in Planet.values()
println Planet.values()*.name().collect { it.toLowerCase().capitalize() }

def desc = { Planet p ->
    switch (p) {
        case Planet.EARTH: return 'home'
        case [Planet.MERCURY]: return 'hot'
        default: return 'gas giant'
    }
}
println Planet.values().collect(desc)

def range = Planet.MERCURY..Planet.JUPITER
println range.toList()
