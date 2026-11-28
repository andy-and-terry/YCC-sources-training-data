boolean isAutomorphic(long n) {
    return (n * n).toString().endsWith(n.toString())
}

println((0..999).findAll { isAutomorphic(it) }) // [0, 1, 5, 6, 25, 76, 376, 625]
