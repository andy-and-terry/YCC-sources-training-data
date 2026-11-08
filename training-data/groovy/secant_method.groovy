double secant(Closure f, double a, double b) {
    40.times {
        double fa = f(a), fb = f(b)
        if (Math.abs(fb - fa) < 1e-15) return
        double c = b - fb * (b - a) / (fb - fa)
        a = b
        b = c
    }
    b
}

printf("%.8f%n", secant({ x -> x * x - 2 }, 1d, 2d))
