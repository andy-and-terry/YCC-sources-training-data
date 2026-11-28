int modInverse(int a, int m) { (1..<m).find { a * it % m == 1 } }

String affine(String s, int a, int b, boolean decrypt = false) {
    int inv = modInverse(a, 26)
    s.collect { String ch ->
        if (!(ch ==~ /[A-Z]/)) return ch
        int x = ch.charAt(0) - ('A' as char)
        int y = decrypt ? Math.floorMod(inv * (x - b), 26) : (a * x + b) % 26
        String.valueOf((char) (y + 65))
    }.join()
}

def c = affine('AFFINE', 5, 8)
println "$c ${affine(c, 5, 8, true)}"
