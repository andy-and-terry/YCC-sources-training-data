func matrixChainOrder(_ dims: [Int]) -> Int {
    let n = dims.count - 1
    guard n > 1 else { return 0 }

    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
    for length in 2...n {
        for i in 0...(n - length) {
            let j = i + length - 1
            dp[i][j] = Int.max
            for k in i..<j {
                let cost = dp[i][k] + dp[k + 1][j] + dims[i] * dims[k + 1] * dims[j + 1]
                if cost < dp[i][j] {
                    dp[i][j] = cost
                }
            }
        }
    }
    return dp[0][n - 1]
}

// Matrices: A1(40x20), A2(20x30), A3(30x10), A4(10x30)
let dims = [40, 20, 30, 10, 30]
print(matrixChainOrder(dims))
