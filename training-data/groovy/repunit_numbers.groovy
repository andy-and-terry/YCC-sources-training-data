// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
BigInteger r = 0
def out = []
8.times {
    r = r * 10 + 1
    out << r
}
println out.join(' ')
