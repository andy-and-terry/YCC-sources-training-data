// Lattice paths with a DP row.
def lattice(int n) {
    def row = [1] * (n + 1)
    n.times { (1..n).each { j -> row[j] += row[j - 1] } }
    row[n]
}
println lattice(3)
