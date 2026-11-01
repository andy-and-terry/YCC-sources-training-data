// Greedy sequence whose pairwise sums are all distinct.
def seq = []
def sums = [] as Set
int cand = 1
while (seq.size() < 8) {
    def fresh = (seq + [cand]).collect { it + cand }
    if (fresh.toSet().size() == fresh.size() && fresh.every { !sums.contains(it) }) {
        seq << cand
        sums.addAll(fresh)
    }
    cand++
}
println seq.join(' ')
