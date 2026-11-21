// Cantor pairing function and its inverse.
long pair(long x, long y) { (x + y) * (x + y + 1) / 2 + y }

def unpair(long z) {
    long w = ((Math.sqrt(8.0 * z + 1) - 1) / 2) as long
    long y = z - w * (w + 1).intdiv(2)
    [w - y, y]
}

println pair(3, 4)
println unpair(32).join(' ')
