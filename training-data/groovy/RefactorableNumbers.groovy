int tau(int n) { (1..n).count { n % it == 0 } }

println (1..59).findAll { it % tau(it) == 0 }.join(' ') // 1 2 8 9 12 18 24 36 40 56
