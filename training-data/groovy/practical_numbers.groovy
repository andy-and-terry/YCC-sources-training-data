// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
boolean isPractical(int n) {
    long reach = 1L // bit i set <=> i is a subset sum
    (1..n).each { d -> if (n % d == 0) reach |= (reach << d) }
    long mask = (1L << (n + 1)) - 1
    (reach & mask) == mask
}

println (1..40).findAll { isPractical(it) }.join(' ')
