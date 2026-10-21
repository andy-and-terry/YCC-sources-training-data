// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
def padovan(int count) {
    def p = []
    (0..<count).each { i -> p << (i < 3 ? 1 : p[i - 2] + p[i - 3]) }
    return p
}

println padovan(15).join(' ')
