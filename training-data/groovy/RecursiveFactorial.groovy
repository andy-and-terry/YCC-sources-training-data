def factorialRecursive(int n) {
    return n <= 1 ? 1 : n * factorialRecursive(n - 1)
}

println factorialRecursive(10)
