// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
def isKeith = { int n ->
    def seq = n.toString().collect { it as int }
    int k = seq.size()
    while (seq.last() < n) {
        seq << seq.takeRight(k).sum()
    }
    seq.last() == n
}

println((10..<1200).findAll(isKeith).join(' '))
