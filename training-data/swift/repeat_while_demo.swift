func digitCount(_ n: Int) -> Int {
    var count = 0
    var x = abs(n)
    repeat {
        count += 1
        x /= 10
    } while x > 0
    return count
}

print(digitCount(0))
print(digitCount(12345))
print(digitCount(-9876))

var attempt = 0
repeat {
    attempt += 1
    print("attempt \(attempt)")
} while attempt < 3
