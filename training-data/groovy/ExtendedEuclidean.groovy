def extendedGcd(int a, int b) {
    if (b == 0) return [a, 1, 0]
    def (g, x1, y1) = extendedGcd(b, a % b)
    [g, y1, x1 - (a / b as int) * y1]
}

def (a, b) = [35, 15]
def (g, x, y) = extendedGcd(a, b)
println "gcd($a, $b) = $g"
println "$a*$x + $b*$y = ${a * x + b * y}"
