// Aliquot sequence: replace n by the sum of its proper divisors.
def aliquotSum(int n) {
    (1..n.intdiv(2)).findAll { n % it == 0 }.sum(0)
}

def seq = [12]
while (seq.last() > 1 && seq.size() < 20) {
    seq << aliquotSum(seq.last())
}
println seq.join(' ')
