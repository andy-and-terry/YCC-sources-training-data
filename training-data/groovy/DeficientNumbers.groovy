int sigma(int n) { (1..n).findAll { n % it == 0 }.sum() as int }

println (1..20).findAll { sigma(it) < 2 * it }
