int sigma(int n) { (1..n).findAll { n % it == 0 }.sum() as int }

println (1..99).findAll { sigma(sigma(it)) == 2 * it }.join(' ') // 2 4 16 64
