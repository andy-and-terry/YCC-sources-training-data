// Bulls and Cows scoring for equal-length digit strings.
def score(String secret, String guess) {
    def pairs = [secret.toList(), guess.toList()].transpose()
    int bulls = pairs.count { s, g -> s == g }
    def rest = pairs.findAll { s, g -> s != g }
    def sc = rest.countBy { it[0] }
    def gc = rest.countBy { it[1] }
    int cows = sc.collect { c, n -> Math.min(n, gc[c] ?: 0) }.sum(0)
    [bulls, cows]
}

def (b, c) = score('1807', '7810')
println "$b bull(s), $c cow(s)"
