// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
def isHamming = { int start ->
    int n = start
    [2, 3, 5].each { p -> while (n % p == 0) n = n.intdiv(p) }
    n == 1
}

def found = []
for (int n = 1; found.size() < 20; n++) {
    if (isHamming(n)) found << n
}
println found.join(' ')
