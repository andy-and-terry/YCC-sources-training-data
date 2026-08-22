def safeDivide(a, b) {
    try {
        return a / b
    } catch (ArithmeticException e) {
        return "undefined: ${e.message}"
    }
}

println safeDivide(10, 2)
println safeDivide(5, 0)
