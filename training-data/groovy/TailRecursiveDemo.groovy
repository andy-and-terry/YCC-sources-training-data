import groovy.transform.TailRecursive

@TailRecursive
long factorial(long n, long acc = 1) {
    n <= 1 ? acc : factorial(n - 1, n * acc)
}

@TailRecursive
long gcd(long a, long b) {
    b == 0 ? a : gcd(b, a % b)
}

@TailRecursive
long sumTo(long n, long acc = 0) {
    n == 0 ? acc : sumTo(n - 1, acc + n)
}

println factorial(10)
println gcd(48, 18)
println sumTo(100000)
