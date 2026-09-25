func step(_ n: Int) -> Int {
    var n = n, s = 0
    while n > 0 {
        s += (n % 10) * (n % 10)
        n /= 10
    }
    return s
}

func isHappy(_ n: Int) -> Bool {
    var slow = n, fast = step(n)
    while fast != 1 && slow != fast {
        slow = step(slow)
        fast = step(step(fast))
    }
    return fast == 1
}

print((1...50).filter(isHappy))
