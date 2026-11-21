# Cantor pairing function and its inverse.
function pair(x, y) { return (x + y) * (x + y + 1) / 2 + y }
function unpair(z,    w, y) {
    w = int((sqrt(8 * z + 1) - 1) / 2)
    y = z - w * (w + 1) / 2
    return (w - y) " " y
}
BEGIN {
    print pair(3, 4)
    print unpair(32)
}
