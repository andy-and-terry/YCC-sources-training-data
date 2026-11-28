List<Integer> order(int n, int k) {
    int cycle = 2 * (k - 1)
    (0..<n).toList().sort(false) { a, b ->
        def ra = a % cycle < k ? a % cycle : cycle - a % cycle
        def rb = b % cycle < k ? b % cycle : cycle - b % cycle
        ra <=> rb ?: a <=> b
    }
}

String encrypt(String t, int k) { order(t.size(), k).collect { t[it] }.join() }

String decrypt(String c, int k) {
    def out = new char[c.size()]
    order(c.size(), k).eachWithIndex { i, pos -> out[i] = c[pos] as char }
    new String(out)
}

def c = encrypt('WEAREDISCOVERED', 3)
println "$c ${decrypt(c, 3)}"
