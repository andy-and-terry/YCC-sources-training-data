boolean isPrime(long n) {
    n >= 2 && (2L..<(n + 1)).takeWhile { it * it <= n }.every { n % it != 0 }
}

def out = []
long n = 2
while (out.size() < 10) {
    long r = n.toString().reverse().toLong()
    if (r != n && isPrime(n) && isPrime(r)) out << n
    n++
}
println out.join(' ') // 13 17 31 37 71 73 79 97 107 113
