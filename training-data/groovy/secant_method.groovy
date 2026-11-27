def secant(Closure f, double x0, double x1) {
    50.times {
        double f0 = f(x0), f1 = f(x1)
        if (f1 == f0) return
        double next = x1 - f1 * (x1 - x0) / (f1 - f0)
        x0 = x1
        x1 = next
    }
    x1
}

printf('%.10f%n', secant({ it * it - 2 }, 1d, 2d))
