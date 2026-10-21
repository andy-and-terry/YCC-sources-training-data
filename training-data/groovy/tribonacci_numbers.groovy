// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
def tribonacci(int count) {
    def t = [0L, 0L, 1L]
    while (t.size() < count) {
        t << t[-1] + t[-2] + t[-3]
    }
    t.take(count)
}

println "Tribonacci: ${tribonacci(15).join(', ')}"
