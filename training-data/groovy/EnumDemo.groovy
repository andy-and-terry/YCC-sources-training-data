enum Planet {
    MERCURY(3.303e+23, 2.4397e6),
    EARTH(5.976e+24, 6.37814e6)

    final double mass, radius
    Planet(double mass, double radius) {
        this.mass = mass
        this.radius = radius
    }

    double surfaceGravity() { 6.67300E-11 * mass / (radius * radius) }
}

Planet.values().each { printf '%s %.2f%n', it, it.surfaceGravity() }
println Planet.valueOf('EARTH').ordinal()
println Planet.EARTH.next()
println Planet.values()*.name()

switch (Planet.MERCURY) {
    case Planet.EARTH: println 'home'; break
    case Planet.MERCURY: println 'hot'; break
}
