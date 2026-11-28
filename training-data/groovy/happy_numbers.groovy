boolean isHappy(int start) {
    def seen = [] as Set
    int n = start
    while (n != 1 && seen.add(n)) {
        n = n.toString().collect { (it as int) - 48 }.sum { it * it }
    }
    return n == 1
}

def found = []
for (int n = 1; found.size() < 8; n++) {
    if (isHappy(n)) found << n
}
println found // [1, 7, 10, 13, 19, 23, 28, 31]
