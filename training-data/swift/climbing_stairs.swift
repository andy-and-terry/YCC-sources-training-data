func climbStairs(_ n: Int) -> Int {
    if n <= 2 { return n }
    var prev = 1
    var curr = 2
    for _ in 3...n {
        let next = prev + curr
        prev = curr
        curr = next
    }
    return curr
}

for i in 1...8 {
    print("\(i): \(climbStairs(i))")
}
