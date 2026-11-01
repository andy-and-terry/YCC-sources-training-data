// Leyland numbers: x^y + y^x for x >= y >= 2.
def vals = []
(2..4).each { x ->
    (2..x).each { y ->
        vals << (x.toBigInteger() ** y) + (y.toBigInteger() ** x)
    }
}
println vals.join(' ')
