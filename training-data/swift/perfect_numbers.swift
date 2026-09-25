enum Classification { case perfect, abundant, deficient }

func aliquotSum(_ n: Int) -> Int {
    guard n > 1 else { return 0 }
    var sum = 1
    var i = 2
    while i * i <= n {
        if n % i == 0 {
            sum += i
            if i != n / i { sum += n / i }
        }
        i += 1
    }
    return sum
}

func classify(_ n: Int) -> Classification {
    let s = aliquotSum(n)
    return s == n ? .perfect : s > n ? .abundant : .deficient
}

for n in [6, 12, 28, 13, 8128] { print(n, classify(n)) }
